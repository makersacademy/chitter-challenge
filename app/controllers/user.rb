module ChitterModule
  module Routes

    class UserController < Base

      get '/users/new' do
        erb :'users/new'
      end

      post '/users' do
        @user = User.create(email: params[:email],
                           name: params[:name],
                           user_name: params[:user_name],
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

      get '/users/sign-in' do
        erb :'users/sign_in'
      end

      post '/users/sign-in' do
        user = User.authenticate(params[:user_name], params[:password])
        if user
          session[:user_id] = user.id
          redirect to('/peeps')
        else
          flash.now[:errors] = ['The username or password is incorrect']
        end
      end

      delete '/user-signout' do
        session.clear
        flash.now[:notice] = ['goodbye!']
      end
    end
  end
end