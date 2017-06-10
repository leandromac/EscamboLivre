class Backoffice::CategoriesController < BackofficeController
before_action :set_category, only: [:edit, :update]

    def index
        @categories = Category.all
        @category = Category.new
    end

    def new
        @category = Category.new
    end

    def create
        @categories = Category.all
        @category = Category.new(params_category)
        if @category.save
            redirect_to backoffice_categories_path, notice: "Category #{@category.description} was successfully save!"
        else
            render :index
        end
    end

    def edit
    end

    def update
        if @category.update(params_category)
            redirect_to backoffice_categories_path, notice: "Category #{@category.description} was successfully save!"
        else
            render :edit
        end
    end

    private

        def params_category
            params.require(:category).permit(:description)
        end

        def set_category
            @category = Category.find(params[:id])
        end

end
