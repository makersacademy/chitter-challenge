require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class ChitterChatter < Sinatra::Base

  enable :sessions
  set :session_secret, "verysecret"
  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, 'public'

  use Rack::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  get '/' do
     @peeps = Peep.all
    @peeps.reverse!
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                        name: params[:name],
                        username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash[:errors] = @user.errors.full_messages
      redirect to('users/new')
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = "Goodbye!"
    redirect to('/')
  end

  get '/peeps/new' do
    if session[:user_id] != nil
      erb :'peeps/new'
    else
      flash[:notice] = "Please log in or sign up to post a peep"
      redirect to('/')
    end
  end

  post '/peeps' do
    @peep = Peep.create(text: params[:peep], user_id: session[:user_id], timestamp: Time.now)
    @peep.save
    @user = User.first(id: @peep.user_id)
    redirect to('/')
  end

  get '/users/:username' do
    @user = User.first(username: params[:username])
    @username = params[:username]
    @name = @user.name
    @peeps = Peep.all(user_id: @user.id)
    @peeps.reverse!
    erb :"/users/profile"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end