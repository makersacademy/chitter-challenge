require './app/helpers/app_helpers'

module Contro
    module Routes
      class SessionController < Base
        get '/sessions/new' do
          erb :'sessions/new'
        end

        post '/sessions' do
          # byebug
          user = User.authenticate(params[:email], params[:password])
          if user
            session[:user_id] = user.id
            redirect to ('/')
          else
            redirect to '/'
          end
        end

        delete '/sessions' do
          session.clear
          redirect '/goodbye'
        end

        get '/goodbye' do
          erb :goodbye
        end

       end
    end
end