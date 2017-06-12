class BackofficeController < ApplicationController

    before_action :authenticate_admin!
    layout "backoffice"

    # Pundit - Current user to current admin
    def pundit_user
        current_admin
    end

end