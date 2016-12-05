class Chitter < Sinatra::Base

  get '/sign_up' do
    @user = User.new
    erb :sign_up
  end

  get '/log_in' do
     @user = User.new
    erb :log_in
  end

  post '/log_in' do
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:id] = user.id
      @posts = Peep.all
      redirect ('/peeps')
    else
      flash.now[:notice] = "The password or email is not correct!"
      erb :log_in
    end
  end


  post '/users' do
    @user = User.new(email: params[:email], name: params[:name],
                    username: params[:username], password: params[:password],
                    password_confirmation: params[:confirm_password] )

    if @user.save
      session[:id] = @user.id
      @posts = Peep.all
      redirect ('/peeps')
    else
      flash.now[:errors]
      erb :sign_up
    end
  end

end
