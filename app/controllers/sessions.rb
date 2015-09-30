module BeefBurgers
  module Routes
    class Sessions < Base

      get '/sessions/sign_up' do
        @user = User.new
        erb :'users/new'
      end

      post '/sessions/sign_up' do
        @user = User.create(username: params[:username],
                            email: params[:email],
                            password: params[:password],
                            password_confirmation: params[:password_confirmation])
        if @user.save
          flash[:welcome_user] = "Welcome, #{@user.username}"
          session[:user_id] = @user.user_id
          redirect('/')
        else
          flash[:errors] = @user.errors.full_messages
          redirect('sessions/sign_up')
        end
      end

      get '/sessions/new' do
        erb :'sessions/new'
      end

      post '/sessions/new' do
        user = User.authenticate(params[:username], params[:password])
        if user
          session[:user_id] = user.user_id
          flash[:welcome_user] = "Welcome, #{user.username}"
          redirect('/')
        else
          flash.now[:errors] = "Email/password combination incorrect"
          erb :'/sessions/new'
        end
      end

      delete '/sessions' do
        @user = nil
        session.clear
        flash[:goodbye] = "Goodbye!"
        redirect('/')
      end

    end
  end
end