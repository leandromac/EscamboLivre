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

        @category = CategoryService.create(params_category)
        unless @category.errors.any?
            redirect_to backoffice_categories_path, notice: "Category <b>#{@category.description}</b> was successfully save!"
        else
            render :index
        end
    end

    def edit
    end

    def update
        if @category.update(params_category)
            redirect_to backoffice_categories_path, notice: "Category <b>#{@category.description}</b> was successfully save!"
        else
            render :edit
        end
    end

    private

        def params_category
            params.require(:category).permit(:description)
        end

        def set_category
            @category = Category.friendly.find(params[:id])
        end

end
