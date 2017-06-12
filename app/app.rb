ENV['RACK_ENV'] ||= 'development'

require_relative './data_mapper_setup.rb'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'

  get '/' do
    redirect to('/sessions/new')
  end

  get '/feed' do
    @peeps = Peep.all.reverse
    erb(:feed)
  end

  post '/peep' do
    current_user.peeps.create(peep: params[:peep], time: Time.new.strftime("%H:%M"), date: Time.new.strftime("%Y-%m-%d"))
    redirect to '/feed'
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You have signed out'
    redirect to '/feed'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/feed')
    else
      flash.keep[:notice] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
    password: params[:password],
    username: params[:username],
    name: params[:name])
    session[:user_id] = user.id
    redirect to('/feed')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
