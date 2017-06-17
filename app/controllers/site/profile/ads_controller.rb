class Site::Profile::AdsController < Site::ProfileController
    before_action :set_ad, only: [:edit]

    def index
        @ads = Ad.to_the(current_member)
        #@ads = Ad.where(member: current_member) <- define que o membro só pode visualizar as suas próprias ads
    end

    def edit

    end

    private

    def set_ad
        @ad = Ad.find(params[:id])
    end

end