module Chitter

  module Routes

    class Sessions < Base

      get '/sessions/new' do
        erb :'sessions/new'
      end

      post '/sessions' do
        user = User.authenticate(params[:email], params[:password])
        session[:user_id] = user.id
        redirect('/')
      end

      delete '/sessions' do
        user = User.get(session[:user_id])
        flash[:notice] = "Goodbye, #{user.user_name}!"
        session.clear
        redirect('/')
      end

    end

  end

end
