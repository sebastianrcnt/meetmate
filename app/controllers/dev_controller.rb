class DevController < ApplicationController
    def users
        @users = User.all
    end

    def destroy_user
        @user = User.find_by_id(params[:id])
        if @user
            @user.destroy
        end
        redirect_to action: :users
    end

    def login_user
        session[:current_user_id] = params[:id]
        redirect_to action: :users
    end

    def logout_user
        session[:current_user_id] = nil
        redirect_to action: :users
    end
end
