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
        user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.save
          session[:user_id] = user.id
          redirect '/peeps'
        else
          flash.now[:errors] = user.errors.full_messages
        end
      end

      get '/user/password_reset' do
        erb :'/users/password_reset'
      end

      patch '/users/password_reset' do
        user = User.first(email: params[:email])
        user.update(password_token: random_token)
        flash.next[:notice] = "Password reset sent"
        redirect '/session/new'
      end

      get '/password_reset/:password_token' do
        session[:user_id] = User.first(password_token: params[:password_token]).email
        erb :'/users/new_password'
      end

      post '/password_reset' do
        user = User.first(email: session[:user_id])
        user.update(password: params[:password], password_confirmation: params[:password_confirmation], password_token: nil)
        if user.save
          session.clear
          redirect '/session/new'
        else
          flash.now[:errors] = ["Passwords do not match"]
          erb :'/users/new_password'
        end
      end

      get '/session/new' do
        if session[:user_id].nil?
          flash.now[:notice]
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
          erb :'/users/sign_in'
        end
      end

      delete '/session/end' do
        session.clear
        redirect '/'
      end
    end
  end
end
