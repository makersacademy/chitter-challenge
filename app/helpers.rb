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

    def peep_error?
      params[:peep].length >140
    end


    def readable_date(created_on_date)
      created_on_date.strftime("%m/%d/%Y")
    end

    def readable_time(created_at_time)
      created_at_time.strftime("%I:%M%p") 
    end

end
