require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
    redirect '/chitter'
  end

  get '/chitter' do
    erb :chitter
  end

  post '/chitter' do
    p "Peep submitted"
    p params
    erb :chitter
  end

  get '/chitter/peeps' do
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $0
end
