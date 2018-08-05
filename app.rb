require 'sinatra/base'
require './lib/peep'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/new_peep' do
    erb :"new_peep"
  end

  post '/peeps' do
    Peep.create(peep: params['peep'])
    redirect '/peeps'
  end

  run! if app_file == Chitter
end
