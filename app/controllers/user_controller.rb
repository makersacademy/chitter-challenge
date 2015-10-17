module ChitterApp
  module Routes
    class UserController < Base

      get '/users/new' do
        @user = User.new
        erb :'users/new'
      end

      post '/users' do
        @user = User.create(email: params[:email],
                    handle: params[:handle],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
        if @user.save
          session[:user_id] = @user.id
          session[:user] = params[:handle]
          redirect to('/peeps')
        else
          flash.now[:errors] = @user.errors.full_messages
          erb :'users/new'
        end
      end

      get '/sessions/new' do
        erb :'sessions/new'
      end

      post '/sessions' do
        user = User.authenticate(params[:handle], params[:password])
        if user
          session[:user_id] = user.id
          session[:user] = params[:handle]
          redirect to('/peeps')
        else
          flash.now[:errors] = ['The username or password is incorrect']
          erb :'sessions/new'
        end
      end

      delete '/sessions' do
        session[:user_id] = nil
        session[:user] = nil
        flash.next[:notice] = 'goodbye!'
        redirect to('/sessions/new')
      end

    end
  end
end
