class App < Sinatra::Base

  get '/sessions/new' do
    erb(:'/sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/cheeps')
    else
      flash.now[:errors] = ['The user name or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/cheeps'
  end

end
