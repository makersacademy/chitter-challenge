require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peep/new' do
    Peep.create(description: params[:peep])
  end

end
