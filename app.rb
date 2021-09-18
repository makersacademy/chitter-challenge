require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  $peeps = []

  get '/' do
    erb :index
  end

  get '/peep_sent' do
    @peep = params['peep']
    $peeps << @peep
    erb :peep_sent
  end

  run! if app_file == $0
end