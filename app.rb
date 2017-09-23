ENV["RACK_ENV"] ||= "development"

require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require './models/peep'

# Chitter.setup(:default, "postgres://localhost/chitter")

class Chitter < Sinatra::Base
  get '/peep' do
    erb(:peep)
  end

  post '/wall' do
    peep = Peep.create(peep: params[:peep])
    peep.save
    redirect '/view'
  end

  get '/view' do
    @peeps = Peep.get(1)
    # p @peeps.peep
    erb(:view)
  end

  run! if app_file== $0
end
