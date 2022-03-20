class AuthController < ApplicationController
  def kakao_login; end

  def kakao_login_callback
    redirect_to action: 'kakao_info', auth_code: params[:code]
  end

  def kakao_info
    @auth_code = params[:auth_code]
  end
end
