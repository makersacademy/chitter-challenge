ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require './app/models/user'
require './app/models/peep'

class Chitter < Sinatra::Base

  use Rack::MethodOverride

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
        erb(:'users/new')
  end

  post '/users' do
    @user = User.new(name: params[:name],
    username: params[:username],
    email: params[:email],
    password: params[:password])

    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['We already have that email']
      erb :'users/new'
    end

  end

  get '/peeps' do
    @peeps = Peep.all(:order => :id.desc)
    erb(:'links/peeps')
  end

  get '/peep' do
    current_user
    if @current_user
      erb(:'links/peep')
    else
      flash.now[:errors] = 'Please sign in first to Peep'
      erb :'sessions/new'
    end
  end

  post '/peep' do
    current_user
    peep = Peep.create(:user_id => @current_user.id, :message => params[:message],:time => Time.now )
    redirect '/peeps'
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
      flash.now[:errors] = 'Sorry, email / password incorrect please try again'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Thanks for visiting Chitter, see you again soon'
    redirect to '/peeps'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
