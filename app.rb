require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/new_peep' do
    Peep.create(peep: params['peep'])
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end
  
  run! if app_file == $0
end