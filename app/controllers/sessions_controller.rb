class Chitter

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      erb :'sessions/home'
    else
      flash.now[:errors] = ['The email and/or password you provided are incorrect']
      erb :'/sessions/new'
    end
  end


end
