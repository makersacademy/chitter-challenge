class Chitter < Sinatra::Base
  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    # p params[:username_or_email]
    # p params[:password]
    # p User.all
    user = User.authenticate(params[:username_or_email],params[:password])
    # p user
    if user
      session[:user_id] = [user.id]
      redirect '/peeps'
    else
      flash.now[:login_error] = "Wrong username/email or password!"
      erb :'session/new'
    end
  end
end
