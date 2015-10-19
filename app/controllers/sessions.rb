module ChitterApp

  module Routes

    class Sessions < Base

      get '/sessions/new' do
        @user = User.new
        erb :'sessions/new'
      end

      post '/sessions/new' do
        user = User.authenticate(params[:email], params[:password])
        if user
          session[:user_id] = user.id
          session[:username] = user.username
          redirect to('/')
        else
          flash.now[:errors] = ['The email or password is incorrect']
          erb :'sessions/new'
        end
      end

      delete '/sessions' do
        session[:user_id] = nil
        flash.now[:notice] = "Goodbye!"
        erb :'sessions/goodbye'
      end
    end

  end

end
