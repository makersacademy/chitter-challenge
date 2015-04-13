class Chitter

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    email = params[:email]
    password = params[:password]
    user = User.authenticate email, password
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash[:errors] = ['The username or password are incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = 'Good Bye!'
    redirect to '/'
  end

end
