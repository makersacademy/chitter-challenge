ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/user.rb'
require_relative './models/peep.rb'


class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
      session[:user_id] = user.id
      redirect('/peeps/new')
  end

  get '/peeps/index' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/index' do
    Peep.create(peep: params[:peep], :created_at => Time.now)
    redirect '/peeps/index'
  end

  get '/session/new' do
    erb :'session/new'
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps/index')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'session/new'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/peeps/index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
