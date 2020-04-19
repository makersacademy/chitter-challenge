class Chitter < Sinatra::Base

  get '/:username' do
    @user = User.find_by(username: params[:username])
    @peeps = Peep.where(user_id: @user.id)
    erb :'users/show'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    if !User.unique_username?(params[:username])
      flash[:notice] = error_not_unique('username')
      redirect '/users/new'
    elsif !User.unique_email?(params[:email])
      flash[:notice] = error_not_unique('email')
      redirect '/users/new'
    else
      user = User.create(user_params)
      session[:user_id] = user.id
      redirect '/peeps'
    end
  end

  get '/users/login' do
    erb :'sessions/new'
  end

  post '/users/login' do
    user = User.where({ username: params[:username] }).first
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect '/peeps'
    elsif user.nil?
      flash[:notice] = 'Sorry this username does not exist'
      redirect '/users/login'
    else
      flash[:notice] = 'Incorrect password entered'
      redirect '/users/login'
    end
  end

  get '/users/logout' do
    session.clear
    redirect '/'
  end

  private

  ERR_UNIQUE_EMAIL = "Sorry the email you entered is already taken. Please try another"
  ERR_UNIQUE_USERNAME = "Sorry the username you entered is already taken. Please try another"

  def user_params
    { 
      name: params[:name], 
      username: params[:username], 
      email: params[:email], 
      password: params[:password] 
    }
  end

end
