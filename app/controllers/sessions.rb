module Chitter
  module Routes
    class Sessions < Base

      get '/sessions/new' do
        erb :'sessions/new'
      end

      post '/sessions' do
        user = User.authenticate(params[:email], params[:password])
        if user
          session[:user_id] = user.id
          redirect to('/peeps')
        else
          flash.now[:errors] = ['The email or password is incorrect']
          erb :'sessions/new'
        end
      end

      delete '/sessions' do
        flash.now[:notice] = ['Goodbye!']
        @user = User.new
        session[:user_id] = nil
        erb :'/sessions/new'
      end

    end
  end
end
