class Chitter < Sinatra::Base

    get '/sign_up' do
      @user = User.new
      erb :sign_up
      end

    post '/users' do
      @user = User.new(name: params[:name],
                      email: params[:email],
                      username: params[:username],
                      password: params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect '/home'
      else
        flash.now[:error] = "Signup failed: Those details have already been used"
        erb :sign_up
      end
    end

    get '/sessions/new' do
      erb :sign_in
    end

    post '/sessions' do
      user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        redirect '/home'
      else
        flash.now[:error] = "The username or password is incorrect"
        erb :sign_in
      end
    end

    delete '/sessions' do
      session[:user_id] = nil
      flash.keep[:notice] = "Goodbye!"
      redirect to '/home'
    end
  end
