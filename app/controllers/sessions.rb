class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/feed'
    else
      flash.now[:error] = ["Incorrect username/password"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = "You have been logged out"
    redirect '/feed'
  end

end
