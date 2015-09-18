require_relative './base'

module Bamboo
  module Routes
    class SessionController < Base
      get '/sessions/new' do
        erb :'/sessions/new'
      end

      post '/sessions' do
        user = User.authenticate(params[:handle], params[:password])
        if user
          session[:user_id] = user.id
          redirect to('/peeps')
        else
          flash.now[:errors] = ['The handle or password is incorrect']
          erb :'sessions/new'
        end
      end

      delete '/sessions' do
        flash[:notice] = "Good bye!"
        session[:user_id] = nil
        redirect to('/')
      end
    end
  end
end
