class AuthController < ApplicationController
    def kakao
        user = SocialAuthService.kakao(omniauth_params)
        render json: user
    end

    private
    def omniauth_params
        request.env['omniauth.auth'].except('extra').to_h
    end
end
