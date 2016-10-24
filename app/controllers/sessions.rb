class ChitterChallenge < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      session[:nickname] = user.nickname
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    session[:nickname] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect '/peeps'
  end

end
