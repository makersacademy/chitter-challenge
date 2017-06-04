class Chitter < Sinatra::Base

  get '/sessions/new' do
    @user = User.get(session[:user_id])
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      erb :'/peeps/index'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/'
  end
  
end
