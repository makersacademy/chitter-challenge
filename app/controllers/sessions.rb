class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/posts')
    else
      flash.now[:notice] = "Username or password incorrect"
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:notice] = "Goodbye!"
    redirect to '/'
  end

end
