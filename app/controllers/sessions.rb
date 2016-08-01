class Chitter < Sinatra::Base
  get '/sessions' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:username],params[:password])
    if user
      session[:user_id] = user.id
      redirect '/users'
    else
      flash[:notice] = "password or username incorrect"
      redirect '/sessions'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/users'
  end
end 
