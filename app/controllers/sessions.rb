require_relative 'peeps'

class Chitter < Sinatra::Base

  get '/' do
    erb :'index'
  end

  post '/sessions' do
    @current_user = nil
    flash[:goodbye] = 'Goodbye!'
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      redirect '/peeps'
    else
      flash[:password_error] = 'Incorrect username or password.'
      redirect '/sessions/new'
    end
  end

end
