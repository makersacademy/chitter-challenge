ENV['RACK_ENV'] ||= 'development'
require_relative './lib/peep'
require_relative './lib/user'
require 'sinatra/base'
require 'sinatra/reloader'
# require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    # @user = ??? # where does this come from?
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(params[:peep])
    redirect '/'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect '/'
  end

  run! if app_file == $0
end