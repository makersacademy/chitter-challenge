ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/feed' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :feed
  end

  post '/peep' do
    if current_user
      Peep.create(user: User.get(session[:user_id]), message: params[:peep]) #, date_created: Time.new
      redirect to('/feed')
    else
      flash.keep[:notice] = 'You have to sign in to leave a Peep!'
      redirect to('/')
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name], user_name: params[:user_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/feed')
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
      redirect to('/feed')
    else
      flash.now[:errors] = ['Your email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Cheers for using Chitter. Peace out.'
    redirect to('/feed')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
