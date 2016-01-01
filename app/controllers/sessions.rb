require_relative 'peeps'

class Chitter < Sinatra::Base

  get '/' do
    erb :'index'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:goodbye] = 'Goodbye!'
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:password_error] = 'Incorrect username or password.'
      redirect '/sessions/new'
    end
  end

end
