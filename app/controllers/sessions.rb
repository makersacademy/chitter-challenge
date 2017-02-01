class Chitter < Sinatra::Base
  get '/' do
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    session[:user_id] = nil
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ["The email or password is incorrect"]
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to '/sessions/new'
  end
end
