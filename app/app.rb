ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect :'peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect :'peeps'
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end


#rake db:auto_upgrade RACK_ENV=test
