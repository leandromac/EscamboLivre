class Backoffice::AdminsController < BackofficeController
    before_action :set_admin, only: [:edit, :update, :destroy]
    after_action :verify_authorized, only: [:new, :destroy]
    after_action :verify_policy_scoped, only: :index

    def index
        @admins = Admin.all
      # @admins = Admin.with_full_access
        @admins = policy_scope(Admin)
        @admin = Admin.new
    end

    def new
        @admin = Admin.new
        authorize @admin # authorization pundit
    end

    def create
        @admins = Admin.all
        @admin = Admin.new(params_admin)
        if @admin.save
            redirect_to backoffice_admins_path, notice: "#{@admin.role_i18n} #{@admin.name} was successfully save!"
        else
            render :index
        end
    end

    def edit
    end

    def update

        if @admin.update(params_admin)
            AdminMailer.update_email(current_admin, @admin).deliver_now
            redirect_to backoffice_admins_path, notice: "#{@admin.role_i18n} #{@admin.name} was successfully save!"
        else
            render :edit
        end
    end

    def destroy
        authorize @admin # authorization pundit
        admin_email = @admin.email
        if @admin.destroy
            redirect_to backoffice_admins_path, notice: "#{@admin.role_i18n} #{admin_email} was successfully delete!"
        else
            render :index
        end
    end

    private

    def set_admin
        @admin = Admin.find(params[:id])
    end

    def params_admin
        # Permite editar usuário sem a necessidade de mudar a senha...
        if password_blank?
            params[:admin].except!(:password, :password_confirmation)
        end

        if @admin.blank?
            params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
        else
            params.require(:admin).permit(policy(@admin).permitted_attributes)
        end
    end

    def password_blank?
        params[:admin][:password].blank? &&
        params[:admin][:password_confirmation].blank?
    end

end
