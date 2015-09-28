module ChitterApp
  module Routes
    class UserController < Base
      get '/users/new' do
        erb :'users/new'
      end

      post '/users' do
        @user = User.new(username: params[:username], email: params[:email],
        name: params[:name], password: params[:password],
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

      get '/users/sign_in' do
        erb :'users/sign_in'
      end

      post '/users/sign_in' do
        user = User.authenticate(params[:username],
               params[:password])
        if user
          session[:user_id] = user.id
        else
          flash.next[:errors] = ['The email or password is incorrect']
        end
        redirect '/'   #redirect to peeps page
      end

      delete '/users/sign_out' do
        session[:user_id] = nil
        flash.next[:sign_out] = 'Goodbye!'
        redirect '/users/sign_out'
      end

      get '/users/sign_out' do
        redirect '/'
      end

    end
  end
end
