class Backoffice::AdminsController < BackofficeController
before_action :set_admin, only: [:edit, :update, :destroy]

    def index
        @admins = Admin.all
        @admin = Admin.new
    end

    def new
        @admin = Admin.new
    end

    def create
        @admins = Admin.all
        @admin = Admin.new(params_admin)
        if @admin.save
            redirect_to backoffice_admins_path, notice: "Admin <b>#{@admin.name}</b> was successfully save!"
        else
            render :index
        end
    end

    def edit
    end

    def update

        # Permite editar usuário sem a necessidade de mudar a senha...
        pswd = params[:admin][:password]
        pswd_confirmation = params[:admin][:password_confirmation]

        if pswd.blank? && pswd_confirmation.blank?
            params[:admin].delete(:password)
            params[:admin].delete(:password_confirmation)
        end
        # ...fim

        if @admin.update(params_admin)
            redirect_to backoffice_admins_path, notice: "Admin <b>#{@admin.name}</b> was successfully save!"
        else
            render :edit
        end
    end

    def destroy
        admin_email = @admin.email
        if @admin.destroy
            redirect_to backoffice_admins_path, notice: "Admin <b>#{admin_email}</b> was successfully delete!"
        else
            render :index
        end
    end

    private

        def params_admin
            params.require(:admin).permit(:name, :email, :password, :password_confirmation)
        end

        def set_admin
            @admin = Admin.find(params[:id])
        end

end
