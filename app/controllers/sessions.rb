class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/'
    end
    redirect '/sessions/new'
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
  end


end
