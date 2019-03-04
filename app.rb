require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/database_connection'
require_relative './lib/user'
class Chitter < Sinatra::Base
  enable :sessions
  Database_Connection.setup

  get '/' do
    erb :homepage
  end
  get '/feed' do
    @username = User.username
    @peeps = Peep.all
    erb :feed
  end

  get '/login' do
    erb :login
  end

  get '/Register' do
    erb :register
  end

  get '/new_peep' do
    erb :new_peep
  end

  post '/new_peep' do
    Peep.new(params[:peep])
    redirect '/feed'
  end

  post '/login' do
    User.login(params[:username], params[:password])
    redirect '/feed'
  end

  post '/Register' do
    User.new(params[:username],params[:password],params[:email],params[:fname],params[:sname])
    redirect '/login'
  end
  run! if app_file == $0
end
