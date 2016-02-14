module Helpers

    def session_user
      @session_user ||= User.get(session[:user_id])
    end

    def sign_up_errors?
      @new_user.errors.full_messages.size > 0
    end

    def sign_up_errors
      @new_user.errors.full_messages
    end

    def sign_in_error_type
      if @user.nil? && User.first(user_name: params[:existing_user_name])
        'Access Denied Impersonator'
      else
        'Brother, is that really you?'
      end
    end

end
