class Chitter < Sinatra::Base
  get '/' do
    @user = User.new
    @peeps = Peep.all(:order => [ :time.desc ])
    erb :'sessions/index'
  end

  get '/home' do
    if session[:user_id].nil?
      redirect to('/')
    else
      @peeps = Peep.all(:order => [ :time.desc ])
      erb :'sessions/home'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/home')
    else
      flash.now[:error] = 'The username and/or password is incorrect'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
