require './app/helpers/app_helpers'

module Contro
    module Routes
      class SessionController < Base
        get '/sessions/new' do
          erb :'sessions/new'
        end

        post '/sessions' do
          byebug
          user = User.authenticate(params[:email], params[:password])
          if user == true
            session[:user_id] = user.id
            redirect to ('/')
          else
            redirect to '/'
          end
        end

        delete '/sessions' do
          session.clear
          redirect'/'
        end
       end
    end
end