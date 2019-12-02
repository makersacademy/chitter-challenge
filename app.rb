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
end
