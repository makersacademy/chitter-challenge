class Chitter < Sinatra::Base

  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    user = User.create(name: params[:name], username: params[:username],
                    password: params[:password], email: params[:email],
                    password_confirm: params[:password_confirm])
    if(user.save)
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:warning] = user.errors.full_messages
      erb :'session/new'
    end
  end

  get '/session' do
    erb :'session/index'
  end

  post '/session/create' do
    user = User.authenticate(username: params[:username], password:
                             params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.keep[:error] = 'The email or password is incorrect'
      redirect '/session'
    end
  end

  post '/session/end' do
    session[:user_id] = nil
    flash.keep[:notice] = "You have logged out"
    redirect '/'
  end
end
