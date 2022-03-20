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

    def get_user_info
        current_user_id = session[:current_user_id]
        if current_user_id
            found = User.find_by_id(current_user_id)
            if found
                return found.attributes
            else
                return nil
            end
        else
            return nil
        end
    end
end
