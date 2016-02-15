class Chitter < Sinatra::Base

  get '/users/login' do
    logged_in?
    erb :'/users/login'
  end

  delete '/users/logout' do
    flash[:notice] = "Goodbye #{current_user.name}"
    session.clear
    redirect '/'
  end

  post '/users/login' do
    user = User.first(email: params[:email])
    success = user.login(params[:password]) if user
    if success
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = "Error: Wrong Username or Password"
      redirect '/users/login'
    end
  end

end
