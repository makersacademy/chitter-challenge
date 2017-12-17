class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb(:'sessions/signin')
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:id] = user.id
      redirect to '/'
    else
      flash.now[:errors] = ["Your email or password is incorrect"]
      erb(:'sessions/signin')
    end
  end

  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = "Goodbye"
    redirect to '/'
  end
end
