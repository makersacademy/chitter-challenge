class Ricker < Sinatra::Base

  get '/users/recover' do
    erb :'users/recover'
  end

  post '/users/recover' do
    flash.now[:notice] = "Thanks, please check your inbox for the link"
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do #Is new_user_sign_up too verbose?
    name = params[:name]
    username = params[:username]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    email =params[:email]

    @user = User.new(name: name,
                        username: username,
                        password: password,
                        password_confirmation: password_confirmation,
                        email: email)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect '/rolls/index'
    else
      flash.now[:errors]=@user.errors.full_messages
      erb :'users/new'
    end

  end



end
