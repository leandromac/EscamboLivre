class Site::SearchController < SiteController

    def ads
        @ads = Ad.search(params[:q], fields: [:title], page: params[:page], per_page: Ad::QTT_PER_PG)
        @categories = Category.all
    end

end
