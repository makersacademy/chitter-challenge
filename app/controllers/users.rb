class Chitter < Sinatra::Base
  get '/users/new' do
    @user = User.new
    erb(:sign_up)
  end

  post '/users' do
      @user = User.new(email: params[:email], name: params[:name], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
      if @user.save
        log_in(@user)
      else
        flash.now[:notice] = @user.errors.full_messages
        erb(:sign_up)
      end
  end

  patch '/users' do
    user = User.first(password_token: session[:token])
    if user
      user.update(password: params[:password], password_confirmation: params[:password_confirmation])
      session[:password_token] = nil
      user.update(password_token: nil)
      flash.keep[:notice] = ["Password has been updated"]
      log_in(user)
    else
      flash.now[:notice] = ["Token is invalid"]
      redirect to('/users/reset-password')
    end
  end

  get '/users/reset-password' do
    erb(:reset_password)
  end

  post '/users/reset-password' do
    user = User.first(email: params[:email])
      if user
        user.generate_token
        mailer = MailGun.new
        mailer.send_token(user)
        flash.now[:notice] = ["An email with a confirmation token has ben sent to your inbox"]
        erb(:reset_password)
      else
        flash.now[:notice] = ["The user doesn't exist"]
        erb(:reset_password)
      end
  end

  get '/users/recover' do
    if !params[:token].nil?
      if user = User.first(password_token: params[:token])
        session[:token] = params[:token]
        erb(:recover)
      else
        flash.keep[:notice] = ["Invalid token"]
        redirect to('/users/reset-password')
      end
    else
      flash.keep[:notice] = ["Invalid token"]
      redirect to('/users/reset-password')
    end
  end

  get "/users/:id" do
    if logged_in?
      @user = User.get(params[:id])
      if current_user?(@user)
        @user = User.get(params[:id])
        erb(:"users/user")
      else
        flash.keep[:notice] = ["You can only access your own profile"]
        redirect to("/users/#{current_user.id}")
      end
    else
      flash.keep[:notice] = ["You need to login to peep!"]
      redirect to("/users/new")
    end
  end

end
