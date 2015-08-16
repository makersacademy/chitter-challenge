module Contro
  module Routes
    class UserController < Base

      get '/users/new' do
        erb :'users/new'
      end

      post'/users' do
        @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
        if @user.save
          session[:user_id] = @user.id
          redirect to('/')
        end
      end

    end

  end

end