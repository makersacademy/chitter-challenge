ENV['RACK_ENV'] ||= 'development'
require 'bcrypt'
require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
# require 'securerandom'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  include BCrypt
  enable :sessions
  set :session_secret, 'super secret'
  # TODO explore setting an environment later: ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

  get '/' do
    redirects to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  post '/peeps' do
    peep = Peep.new(name:             current_user.name,
                    username:         current_user.username,
                    message:          params[:message])
    peep.save
    redirect to '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username:              params[:username],
                      email:                  params[:email],
                      password:               params[:password],
                      password_confirmation:  params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      flash.now[:notice] = 'Passwords must match. Please try again.'
      erb ':users/new'
    end
  end


  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    user = User.first(username: params[:username])

    if user
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      flash.now[:notice2] = "We do not have that username. Please signup first so we can log you in."
      redirect to '/users/new'
    end
  end

end
