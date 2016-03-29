class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do

    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect('/peeps/new')
    else
      flash.now[:errors] = ["Incorrect email or password"]
      erb :'sessions/new'
    end
  end

  get '/logout' do
    erb :logout
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect('/logout')
  end

end
