ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peeps' do
    Peep.create(username: params[:username], peep: params[:peep])
    redirect '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:username])
    end
  end

  run! if app_file == $0

end
