ENV['RACK_ENV'] ||= 'development'
require 'bcrypt'
require 'sinatra/base'
require_relative 'data_mapper_setup'
# require 'securerandom'

class Chitter < Sinatra::Base
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

  post '/peeps' do
    peep = Peep.new(name:       params[:name],
                    username:   params[:username],
                    message:    params[:message])
    peep.save
    redirect to '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name:                  params[:name],
                      email:                  params[:email],
                      password:               params[:password],
                      password_confirmation:  params[:password_confirmation])
    session[:user_id] = user.id
    redirect to '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
