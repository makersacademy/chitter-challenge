require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/send_peep' do
    erb :send_peep
  end

  post '/send_peep' do
    Peep.send(peep: params[:peep])
    p 'time?'
    p params[:datetime]
    redirect '/chitter'
  end

  run! if app_file == $0
end
