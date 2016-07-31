class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      flash.next[:notifications] = ['You have logged in']
      redirect '/peeps'
    else
      flash.now[:errors] = ['Username or Password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notifications] = ['You have logged out']
    redirect '/peeps'
  end
end
