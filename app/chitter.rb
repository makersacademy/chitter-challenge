require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = [
      Peep.create(name: 'Cosmin', handle: '@micosmin', peep: "Hello world", timestamp: '10m'),
      Peep.create(name: 'John', handle: '@john', peep: "Hello world - This is John", timestamp: '9m'),
      Peep.create(name: 'Mile', handle: '@mike', peep: "Hello world - This is Mike", timestamp: '8m'),
    ]
    
    erb :peeps
  end

end