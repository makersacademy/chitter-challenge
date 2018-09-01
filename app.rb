require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peep' do
    peep = params[:peep]
    Peep.create(peep)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :chit
  end

  get '/peeps_reverse' do
    @reverse_peep = Peep.reverse
    erb :reverse
  end

  run! if app_file == $0
end
