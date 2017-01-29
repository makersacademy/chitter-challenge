ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/peep'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
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

  delete '/login' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You are now logged out'
    redirect to('/peeps')
  end

  get '/login' do
    erb :'login'
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'login'
    end
  end

  get '/newpeep' do
    erb :'newpeep'
  end

  post '/peeps' do
    Peep.create(words: params[:words], email: params[:email], time: Time.now)
    redirect '/peeps'
  end

  get '/peeps'  do
    @peeps = Peep.all.reverse
    erb :'peeps'
  end

  get '/signup' do
    erb :'signup'
  end

  post '/signup' do
    @user = User.create(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'signup'
    end
  end

  run! if app_file == $0
end
