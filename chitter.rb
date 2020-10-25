require 'sinatra/base'
require_relative './lib/peep.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.list
    erb :index
  end

  get '/create_peep' do
    erb :create_peep
  end

  post '/' do
    Peep.create(message: params[:message])
    redirect '/'
  end
  run! if app_file == $0
end
