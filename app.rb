require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :create
  end

  get '/peeps' do
    p ENV

    @peep = Peep.all
    erb :index
  end

  post '/peeps' do
    # Peep.create(id: params[:id], username: params[:username], 
    # peep: params[:peep], date: params[:date])
    @peep = Peep.all
    redirect '/peeps'
  end

  run! if app_file == $0
end
