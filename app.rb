require 'sinatra/base'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  get '/peeps' do
    @peep = Peep.all
    p "@peep #{@peep}"
    erb :'/peeps/index'
  end

  post '/peeps' do
    p "Params #{params}"
    Peep.create(peep: params['peep'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
