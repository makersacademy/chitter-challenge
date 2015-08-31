require 'sinatra/base'
require 'sinatra/flash'
require_relative '../data_mapper_setup'
require 'sinatra/partial'

class Chitter < Sinatra::Base
  PERMITTED_PARAMS = [:name, :username, :email, :password, :password_confirmation, :message]

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    'Hello Chitter!'
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(permitted_params(params))
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:notice] = 'You successfully signed out'
    redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [:time.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    user = User.first(id: session[:user_id])
    if user
      user.peeps.create(message: params[:message], time: Time.now)
      redirect to('/peeps')
    else
      flash.next[:notice] = "You must be logged in to peep"
      redirect to('sessions/new')
    end
  end

  def permitted_params(parameters)
    parameters.select{|k,v| PERMITTED_PARAMS.include?(k.to_sym) }
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
