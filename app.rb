require 'sinatra/base'
require './lib/cheets'

class Chitter < Sinatra::Base

  get '/' do
    @cheets = Cheets.all
    erb :index
  end

  get '/peep' do
  end

  run! if app_file == $0
end
