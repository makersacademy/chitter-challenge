require_relative './base'
module Bamboo
  module Routes
    class UserController < Base
      get '/users/new' do
        @user = User.new
        erb :'users/new'
      end

      post '/users' do
        @user = User.new(email: params[:email],
                        handle: params[:handle],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
        if @user.save
          session[:user_id] = @user.id
          redirect to('/peeps')
        else
          flash.now[:errors] = @user.errors.full_messages
          erb :'users/new'
        end
      end
    end
  end
end
