require 'sinatra/base'
require './lib/peep'
require_relative './db_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peep = Peep.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add_peep' do
    Peep.add(params[:add])
    redirect '/'
  end

  get '/display' do
    @peep = Peep.all
    erb :display
  end

  run! if app_file == $0
end
