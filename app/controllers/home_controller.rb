class HomeController < ApplicationController
    include ApplicationHelper
    def index
        @user_info = get_user_info
    end

    def landing; end
    def start; end
end
