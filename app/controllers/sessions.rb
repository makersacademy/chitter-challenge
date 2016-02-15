class Chitter < Sinatra::Base

  post '/sessions' do 
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      erb :main
    else
      flash.now[:errors] = ['Email or Password incorrect']
      erb :'/sessions/new'
    end
  end
  
  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect '/'
  end
  
  post '/sessions/new' do
    redirect '/sessions/new'
  end
  
  get '/sessions/new' do
    erb :'sessions/new'
  end
end