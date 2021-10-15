require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/chitter' do
    @peeps = Peeps.all
    erb :index
  end

  get '/chitter/new' do
    erb :new
  end

  post '/chitter' do
    name = params['name']
    peep = params['peep']
    tags = params['tags']

    Peeps.create(name: params[:name], peep: params[:peep], tags: params[:tags])
    redirect '/chitter'
  end

  run! if app_file == $0
end
