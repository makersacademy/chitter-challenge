require_relative './base.rb'

module Turing
  module Routes
    class SessionRoute < Base

      get '/sessions/new' do
        erb :'sessions/new'
      end

      post '/sessions' do
        @user = User.authenticate(params[:username], params[:password])
          if @user
            session[:user_id] = @user.id
            redirect to('/')
          else
            flash.now[:error] = ['The username or password is incorrect']
            erb :'sessions/new'
          end
        end

      delete '/sessions' do
        session.clear
        flash[:notice] = 'Goodbye!'
      end
    end
  end
end