class Site::SearchController < SiteController

    def ads
        @ads = Ad.search(params[:q])
        @categories = Category.all
    end

end
