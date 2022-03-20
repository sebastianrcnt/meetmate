require_relative "../api/kakao.rb"

class AuthController < ApplicationController
  def kakao_login; end

  def kakao_login_code
    @auth_code = params[:code]
    @data = ExternalApiModule::Kakao::request_token(@auth_code)
    @auth_code = @data["code"]
    @access_token = @data["access_token"]
    @refresh_token = @data["refresh_token"]

    @user_info = ExternalApiModule::Kakao::get_user_info(@access_token)

    @user_id = @user_info[:id] # 회원번호
    @nickname = @user_info[:nickname] # 닉네임
    @profile_image = @user_info[:profile_image] # 프로필 이미지

    # check if user is already registered

    @already_registered = false
    if @already_registered
      redirect_to :root
    else
      redirect_to action: "kakao_signup_new", user_info: @user_info, access_token: @access_token
    end
  end

  def kakao_signup_new
    @access_token = params[:access_token]
    @user_info = params[:user_info]
    @profile_image_url = @user_info["kakao_account"]["profile"]["profile_image_url"]
    @nickname = @user_info["kakao_account"]["profile"]["nickname"]
  end

  def kakao_signup_create
  end

  def kakao_unlink
    @access_token = params[:access_token]
    result = ExternalApiModule::Kakao.unlink(@access_token)
    render json: result
  end
end
