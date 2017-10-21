ENV["RACK_ENV"] ||= "development"

require 'bcrypt'
require 'data_mapper'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores
  set :session_secret, 'super secret'

  get '/' do
    'bonjour'
  end

  get '/users/new' do
    erb :"/users/new"
  end

  post '/users' do
    user = User.create(
      :name => params[:name],
      :username => params[:username],
      :email => params[:email],
      :password => params[:password]
    )
    if user.save
      session[:current_user_id] = user.id
      redirect '/users/welcome'
    else
      flash.now[:errors] = user.errors
      erb :"/users/new"
    end
  end

  get '/users/welcome' do
    erb :"users/welcome"
  end

  get '/peeps' do
    erb :"/peeps/index"
  end

  get '/peeps/new' do
    erb :"/peeps/new"
  end

  post '/peeps' do
    peep = Peep.create(content: params[:peep_content], created_at: Time.now)
    peep.user = current_user
    peep.save
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"/sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:current_user_id] = user.id
      redirect '/users/welcome'
    else
      flash.now[:errors] = [["Username and/or password do not match our records"]]
      erb :"/sessions/new"
    end
  end

  helpers do
    def current_user
     @current_user ||= User.get(session[:current_user_id])
    end
    def peeps
      @peeps ||= Peep.all(:order => :created_at.desc)
    end
  end
end

include DataMapperSetup
data_mapper_setup
