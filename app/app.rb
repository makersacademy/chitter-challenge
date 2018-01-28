ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require './app/model/peep'
require './app/model/user'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'really really secret'

  get '/' do
    if current_user
      @welcome_message = ", #{current_user.username}!"
    else
      @welcome_message = "!"
    end
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/submit_signup' do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    session[:user_id] = user.id
    redirect '/'
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/submit_peep' do
    peep = Peep.create(body: params[:content])
    redirect '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
