ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setter'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/sign-up' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], user_name: params[:user_name])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/index')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  delete '/sign-out' do
    flash.keep[:notice] = "Goodbye, #{current_user.user_name}"
    session[:user_id] = nil
    redirect to '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/index' do
    erb :'index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sign-in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/index')
    else
      flash.now[:errors] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

  post '/create-peep' do
    peep = Peep.create(content: params[:content], time: Time.now)
    current_user.peeps << peep
    current_user.save
    redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [:time.desc])
    erb :'peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
