module ApplicationHelper
    def is_logged_in
        current_user_id = session[:current_user_id]
        if current_user_id
            found = User.find_by_id(current_user_id)
            if found
                return  current_user_id ? true : false
            else
                return false
            end
        else
            return false
        end
    end

    def get_current_user
        current_user_id = session[:current_user_id]
        if current_user_id
            user = User.find_by_id(current_user_id)
            return user
        end

        return nil
    end

    def get_current_user_info
        user = get_current_user
        if user
            return user.attributes
        else
            return nil
        end
    end

    def get_current_user_id
        return session[:current_user_id]
    end
end
