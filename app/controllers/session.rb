require_relative 'base'

module Application
  module Routes
    class Sessions < Base

      get '/sessions/new' do
        erb :'/sessions/new'
      end

      post '/sessions' do
        user = User.authenticate(params[:email], params[:password])
        if user
          session[:user_id] = user.id
          redirect '/posts'
        else
          flash[:errors] = ['Password and/or email incorrect']
          redirect '/sessions/new'
        end
      end

      delete '/sessions' do
        session[:user_id] = nil
        flash[:end_of_session] = 'goodbye!'
      end

    end
  end
end