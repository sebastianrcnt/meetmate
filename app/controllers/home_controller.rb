class HomeController < ApplicationController
    include ApplicationHelper
    def index
        # 로그인 안 되었을 때에는 시작 스크린으로
        if not is_logged_in
            redirect_to start_path
        end

        @user_info = get_user_info
    end

    def landing; end
    def start; end
end
