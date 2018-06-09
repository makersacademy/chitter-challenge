require 'sinatra/base'
require_relative './lib/peeps'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peep' do
    Peeps.add(params['peep'])
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peeps.view
    erb :chitter
  end

  post '/new_peep' do
    redirect '/'
  end

end
