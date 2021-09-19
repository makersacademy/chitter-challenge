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
    Peep.send(content: params['peep'], time: Time.now)
    erb :peep_sent
  end

  get '/feed' do
    @peeps = Peep.feed
    @peeps.reverse!
    erb :feed
  end

  run! if app_file == $0
end