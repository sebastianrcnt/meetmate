require_relative "../api/kakao.rb"

class AuthController < ApplicationController
  def kakao_login; end

  def kakao_login_code
    @auth_code = params[:code]
    @data = ExternalApiModule::Kakao::request_token(@auth_code)
    @auth_code = params[:data][:code]
    @data = params[:data][:data]

    @access_token = @data[:access_token]
    @refresh_token = @data[:refresh_token]

    @user_info = ExternalApiModule::Kakao::get_user_info(@access_token)
    @user_id = @user_info[:id] # 회원번호
    @nickname = @user_info[:nickname] # 닉네임
    @profile_image = @user_info[:profile_image] # 프로필 이미지
  end

  def kakao_signup
  end
end
