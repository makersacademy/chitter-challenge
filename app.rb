require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all

    erb :index
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], author: params[:author])
    redirect '/peeps'
  end

  run! if app_file == $0
end
