require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require_relative './lib/chitter'
require_relative './lib/user'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello world'
  end

  get '/peeps' do
    @peeps = Chitter.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
  
    erb :'peeps/new'
  end

  post '/peeps/new/add' do
    Chitter.create(peep: params[:peeps])
    redirect '/peeps'
  end

  get'/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    redirect '/peeps'
  end

  run! if app_file == $0
end
