ENV["RACK_ENV"] ||= "development"

require 'data_mapper'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
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
    session[:current_user_id] = user.id
    redirect '/users/welcome'
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
    redirect '/peeps'
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
