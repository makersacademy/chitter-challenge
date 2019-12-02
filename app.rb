require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Hello world'
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.create(body: params['peep'])
    redirect('/')
  end

  get '/signup' do
    erb :signup
  end

  post '/submit-user-details' do
    
  end
end
