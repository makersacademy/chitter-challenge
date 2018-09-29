require 'sinatra/base'
require './lib/cheets'

# DataMapper.setup(:default, 'postgres://user:password@hostname/database')

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @cheets = Cheets.all
    erb :index
  end

  get '/peep' do
  end

  run! if app_file == $0
end
