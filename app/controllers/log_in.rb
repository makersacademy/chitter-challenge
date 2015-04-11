class Chitter

  post '/log_in' do
    username = params[:username]
    password = params[:password]
    user = User.authenticate(username, password)
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash[:errors] = ['Username or password are incorrect']
      erb :"log_in/new"
    end
  end

  get '/log_in/new' do
    erb :"log_in/new"
  end

  delete '/' do
    user = User.first(id: session[:user_id])
    flash[:notice] = "Goodbye #{user.name}!"
    session[:user_id] = nil
    redirect '/'
  end

end