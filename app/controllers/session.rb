class ChitterApp < Sinatra::Base

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:error] = ["Invalid email or password"]
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect '/'
  end
end
