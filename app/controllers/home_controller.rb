require "modules/auth_module.rb"

class HomeController < ApplicationController
    include ApplicationHelper
    def index
        @user_info = get_user_info
    end
end