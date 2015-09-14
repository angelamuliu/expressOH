class HomeController < ApplicationController
    def index
        if current_user
            @your_requests = current_user.requests.active
            @your_deliveries = current_user.deliveries
        end
    end
end
