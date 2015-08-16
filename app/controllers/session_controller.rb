module Armadillo
  module Routes
    class SessionController < Base

      get '/sessions/new' do
        erb :'sessions/new'
      end

      post '/sessions' do
        @user = User.authenticate(params[:username], params[:password])
        if @user
          session[:user_id] = @user.id
          redirect '/'
        else
          flash.now[:notice] = "The username or password you have entered is incorrect"
          erb :'sessions/new'
        end
      end

      delete '/sessions' do
        session[:user_id] = nil
        flash[:notice] = "Goodbye!"
        redirect'/'
      end

    end
  end
end