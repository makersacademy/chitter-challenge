class Chitter < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], username: params[:username],
      full_name: params[:full_name], password: params[:password],
      password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.save
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:notice] = "Invalid login"
      erb :'users/new'
    end
  end

  get '/users/profile' do
    erb :'users/profile'
  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    user = User.authenticate(params[:email], params[:password])
    if user.nil?
      flash.now[:notice] = ['incorrect username or password']
      erb :'users/login'
    else
      session[:user_id] = user.id
      redirect '/peeps'
    end
  end

  get '/users/logout' do
    session[:user_id] = nil
    redirect '/'
  end

end
