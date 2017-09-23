require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'

# Chitter.setup(:default, "postgres://localhost/chitter")

class Chitter < Sinatra::Base
  get '/peep' do
    erb(:peep)
  end

  post '/wall' do

  end
  run! if app_file== $0
end
