require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter'
    Peep.add(peep: params[:peep])
    erb :index
  end

  get '/new' do
    erb :new
  end

end
