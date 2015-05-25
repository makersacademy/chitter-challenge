module Chitter
  module Routes
    class Sessions < Base

      # Log in page
      get '/sessions/new' do
        erb :'/sessions/new'
      end

      # Log in action
      post '/sessions' do
        email, password = params[:email], params[:password]
        user = User.authenticate(email, password)
        if user
          session[:user_id] = user.id
          redirect to('/')
        else
          flash[:errors] = ['The email or password is incorrect']
          erb :'/sessions/new'
        end
      end

      # Log out action
      delete '/sessions' do
        session[:user_id] = nil
        flash[:notice] = 'Good bye!'
        redirect to('/')
      end

    end
  end
end
