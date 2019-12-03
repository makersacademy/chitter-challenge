require 'sinatra/base'
require './lib/chitter'

class App < Sinatra::Base

  get '/' do
    "Homepage" + " at #{Time.now}"
  end

  get '/chitter' do
    @peeps = Chitter.all
    erb:index
  end

  post '/chitter' do
    Chitter.create(peep: params[:peep])
    redirect '/chitter'
  end

  run! if app_file == $0
end
