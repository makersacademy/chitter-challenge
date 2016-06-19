ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride

  enable :sessions

  set :session_secret, 'super secret'

  get '/' do
    erb(:'user/welcome')
  end

  get '/newuser' do
    @user = User.new
    erb(:'/user/new')
  end

  post '/user' do
    @user = User.create(email: params[:email], password: params[:password], username: params[:username])
    if @user.save
    session[:user_id] = @user.id
    redirect to('/peeps')
    else
    flash.now[:errors] = @user.errors.full_messages
    erb :'user/new'
    end
  end

  post '/registereduser' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
    session[:user_id] = @user.id
    redirect to('/peeps')
    else
    flash.keep[:errors] = ['Incorrect email or password']
    redirect to('/')
    end
  end

  delete '/user' do
    session.clear
    redirect to('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'posts/index')
  end

  post '/peeps' do
    peep = Peep.create(post: params[:post])
    peep.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
