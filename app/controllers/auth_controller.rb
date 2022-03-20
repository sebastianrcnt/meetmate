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

    @user_id = @user_info["id"] # 회원번호
    @profile_image = @user_info[:profile_image] # 프로필 이미지

    # check if user is already registered

    @user = User.where(kakao_user_id: @user_id).take
    @already_registered = @user ? true : false

    if @already_registered
      session[:current_user_id] = @user.id
      redirect_to :root
    else
      redirect_to action: "kakao_signup_new", user_info: @user_info, access_token: @access_token, refresh_token: @refresh_token
    end
  end

  def kakao_signup_new
    @access_token = params[:access_token]
    @refresh_token = params[:refresh_token]
    @user_info = params[:user_info]
    @user_id = @user_info['id']
    @profile_image_url = @user_info["kakao_account"]["profile"]["profile_image_url"]
    @nickname = @user_info["kakao_account"]["profile"]["nickname"]
  end

  def logout
    session[:current_user_id] = nil
    redirect_to :root
  end

  def kakao_signup_create
    person_params = params.require(:user).permit(:kakao_user_id, :access_token, :refresh_token, :profile_image_url)
    user = User.new(person_params)
    user.save
    session[:current_user_id] = user.id
    redirect_to :root
  end

  def kakao_unlink
    @access_token = params[:access_token]
    result = ExternalApiModule::Kakao.unlink(@access_token)
    render json: result
  end

  def show_session
    @sess = session
  end

  def destroy_user
    # id 값이 없으면 오류 발생
    params.require(:id)
    id = params[:id]
    User.find(id).destroy
    flash[:notice] = "successfully deleted"
    redirect_to :root
  end
end
