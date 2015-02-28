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
      flash[:errors] = ["The username or password is incorrect"]
      erb :"sessions/new"
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = ["Good bye!"]
    erb :'sessions/new'
  end

end