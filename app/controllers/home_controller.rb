class HomeController < ApplicationController
    include ApplicationHelper
    def index
        # 로그인 안 되었을 때에는 시작 스크린으로
        if not is_logged_in
            redirect_to start_path
        else
            redirect_to action: :my
        end

    end

    def my; end
    def landing; end
    def start; end
end
