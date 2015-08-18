module TheApp

  module Routes

    class SessionController < Base

      get '/sessions/new' do
        erb :'/sessions/new'
      end

      post '/sessions' do
        user = User.authenticate(params[:username], params[:password])
        if user
          session[:user_id] = user.id
          redirect to('/peeps')
        else
          flash.now[:errors] = ['Your login information is incorrect. Please try again.']
          erb :'/sessions/new'
        end
      end

      delete '/sessions' do
        session.clear
        flash[:sign_out] = 'See you again soon!'
        redirect to('/peeps')
      end

    end

  end

end