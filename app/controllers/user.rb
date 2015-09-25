require_relative './base.rb'

module Turing
  module Routes
    class UserRoute < Base

    get '/users/new' do
        @user = User.new
        erb :'users/newuser'
      end

    post '/users' do
      @user = User.create(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation],
                        name: params[:name],
                        username: params[:username])
      if @user.save
        session[:user_id] = @user.id
        redirect to('/')
      else
        flash.now[:errors] = @user.errors.full_messages
        erb :'users/newuser'
      end
      end
    end
  end
end