require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  $peeps = []

  get '/' do
    erb :index
  end

  post '/send' do
    @peep = params['peep']
    Peep.create(content: params['peep'])
    erb :peep_sent
  end

  run! if app_file == $0
end