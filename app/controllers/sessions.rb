class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id]=user.id
      flash.next[:success]='You are now logged in.'
      redirect '/'
    else
      flash.now[:notice]='The email or password was incorrect'
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice]='You are now signed out'
    redirect to '/'
  end
end
