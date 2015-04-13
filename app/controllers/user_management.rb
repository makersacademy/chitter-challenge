class Chitter < Sinatra::Base
  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    email = params[:email]
    username = params[:username]
    password = params[:password]
    password_confirm = params[:password_confirm]
    @user = User.new(email: email,
                     username: username,
                     password: password,
                     password_confirmation: password_confirm)
    if @user.save
      SendMail.send_welcome(@user.email, @user.username)
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      @user = nil
      erb :'/users/new'
    end
  end

  post '/users/sign-out' do
    user = User.first(id: session[:user_id])
    flash[:notice] = "Goodbye, #{user.username}"
    session[:user_id] = nil
    @user = nil
    redirect to '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    username = params[:username]
    password = params[:password]
    @user = User.authenticate(username,
                              password)
    if @user
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = ['Username or Password incorrect']
      erb :'/sessions/new'
    end
  end
end