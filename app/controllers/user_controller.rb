module Chitter
  module Routes
    class UserController < Base
      get '/users/new' do
        erb :'users/new'
      end

      post '/users' do
        user = User.new(email: params[:email],
                        name: params[:name],
                        nickname: params[:nickname],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
        if user.save
          session[:user_id] = user.id
          flash[:welcome] = "Welcome, #{user.name}"
          flash[:notice] = "Successfully signed up"
          redirect to "/users/#{user.id}/peeps"
        else
          flash.now[:errors] = user.errors.full_messages
          erb :'/users/new'
        end

      end
    end
  end
end
