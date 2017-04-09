class Ricker < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    email = params[:email]
    password = params[:password]
    user = User.authenticate(email,password)

    if user
      session[:user_id] = user.id
      redirect '/rolls/index'
    else
      flash.now[:errors]=['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect '/'
  end


end
