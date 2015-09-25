module Armadillo
  module Routes
    class Sessions < Base
      get '/sessions/login' do
        erb :'sessions/login'
      end

      post '/sessions/login' do
        user = User.authenticate(params[:email], params[:password])
        if user
          session[:user_id] = user.id
          redirect('/')
        else
          flash.now[:errors] = ['The email or password is incorrect']
          erb :'sessions/login'
        end
      end

      delete '/sessions' do
        session.clear
        flash[:notice] = 'You have logged out!'
        redirect('/')
      end

    end
  end
end