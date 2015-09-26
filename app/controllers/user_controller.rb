module ChitterApp
  module Routes
    class UserController < Base
      get '/users/new' do
        erb :'users/new'
      end

      post '/users' do
        @user = User.create(username: params[:username], email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation])
        if @user.save
          session[:user_id] = @user.id
          redirect '/users'
        else
          flash[:errors] = @user.errors.full_messages
          redirect '/users/new'
        end
      end

      get '/users' do
        redirect '/'
      end

    end
  end
end
