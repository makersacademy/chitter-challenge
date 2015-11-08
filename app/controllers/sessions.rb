class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])

    if @user
      session[:user_id] = @user.id
      redirect '/feeds/view'
    else
      flash.now[:errors] = ["Email or password incorrect"]
      erb :'sessions/new'
    end

  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
  end
end

