require './app/helpers/app_helpers'

module Contro
    module Routes
      class SessionController < Base
        get '/sessions/new' do
          erb :'sessions/new'
        end

        post '/sessions' do
          user = User.authenticate(params[:email], params[:password])
          if user
            session[:user_id] = user.id
            # redirect to ('/peeps')
          end
        end

        delete '/sessions' do
          session.clear
          redirect'/'
      end
    end
end