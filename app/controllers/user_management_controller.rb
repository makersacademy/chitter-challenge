module ChitterApp
  module Routes
    class UserManagementController < Base
      get '/user/new' do
        if session[:user_id].nil?
          erb :'/users/sign_up'
        else
          flash.next[:errors] = ["You're already signed in"]
          redirect '/peeps'
        end
      end

      post '/user/new' do
        user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.save
          session[:user_id] = user.id
          redirect '/peeps'
        else
          flash.now[:errors] = user.errors.full_messages
        end
      end

      get '/session/new' do
        if session[:user_id].nil?
          erb :'/users/sign_in'
        else
          flash.next[:errors] = ["You're already signed in"]
          redirect '/peeps'
        end
      end

      post '/session/new' do
        user = User.authenticate(params[:username], params[:password])
        if user
          session[:user_id] = user.id
          redirect '/peeps'
        else
          flash.now[:errors] = ["Password or username is incorrect"]
        end
      end

      delete '/session/end' do
        session.clear
        redirect '/peeps'
      end
    end
  end
end
