module Chitter

  module Routes

    class UserSession < Sinatra::Base
      # 2. Log in
      post '/user/login' do
        user = User.login(params[:user], params[:login_password])
        if user
          session[:user_id] = user.id
          redirect to '/peeps'
        else
          flash[:errors] = ['The username or password is incorrect']
          redirect to '/'
        end
      end

      # 3. Sign out
      delete '/user/login' do
        flash.next[:notice] = "Goodbye #{current_user.name}"
        session[:user_id] = nil
        redirect to '/peeps'
      end

    end

  end

end
