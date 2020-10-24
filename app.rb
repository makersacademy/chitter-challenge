require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/chitter' do
    @peeps = Peeps.all
    erb :chitter
  end

  post '/chitter' do
    Peeps.add(body: params['post'])
    redirect '/chitter'
  end

  run! if app_file == $0
end
