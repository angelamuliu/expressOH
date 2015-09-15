class HomeController < ApplicationController
    def index
        if current_user
            @your_requests = current_user.requests.active.chronological
            @your_deliveries = current_user.deliveries.active.chronological
        end
    end
end
