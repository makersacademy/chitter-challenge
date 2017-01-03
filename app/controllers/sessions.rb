class Chitter < Sinatra::Base

  post '/sessions/new' do
    user = User.first(username: params[:username])
      if user
        if user.authenticated?(params[:password])
          log_in(user)
        else
          flash.now[:notice] = ["Wrong password"]
          erb(:log_in)
        end
      else
        flash.now[:notice] = ["User does not exist"]
        erb(:log_in)
      end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = ['Goodbye!']
    redirect to('/log-in')
  end


end
