ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative '../data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'
require 'sinatra/flash'
require 'tilt/erb'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb(:'users/new')
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(name: params[:name], username: params[:username],
                        email: params[:email], password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/peeps/index')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end
  end

  get '/sessions/new' do
     erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
       session[:user_id] = user.id
       redirect to('/peeps/index')
    else
       flash.now[:errors] = ['The email or password is incorrect']
       erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye'
    redirect to '/users/new'
  end

  get '/peeps/index' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
