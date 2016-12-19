class Chitter < Sinatra::Base

  get '/' do
    erb :'entry'
  end

  get '/session/new' do
    @user = User.new
    erb :'/session/new'
  end

  post '/session' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.keep[:errors] = ["Email and/or password do not match"]
      redirect '/session/new'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    redirect '/peeps'
  end

  get '/session/password-recovery' do
    erb :'/session/password-recovery'
  end

end
