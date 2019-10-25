require 'sinatra/base'
require './lib/peep'
require 'pg'

class ChitterChallenge < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb (:peeps)
  end

  get '/new_peep' do
    erb (:new_peep)
  end

  post '/adding_new_peep' do
    Peep.create(peep: params['peep'],)
    redirect '/'
  end

  run! if app_file == $0
end
