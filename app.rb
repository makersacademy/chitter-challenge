require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do  
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end
  
  get '/new-peep' do
    erb :new_peep
  end

  post '/peep' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
