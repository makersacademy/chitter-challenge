require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require_relative './lib/chitter'

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
    @new_peep = params[:peeps]
    p @new_peep
  end

  run! if app_file == $0
end
