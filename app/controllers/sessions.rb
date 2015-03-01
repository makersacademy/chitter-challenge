class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    username, password = params[:username], params[:password]
    @user = User.authenticate(username, password)
    if @user
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = ["The username or password is incorrect"]
      erb :"sessions/new"
    end
  end

  delete '/sessions' do
    flash[:notice] = ["Good bye!"]
    session[:user_id] = nil
    erb :'sessions/new'
  end

end