require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/chitter' do
    erb :'stream/index'
  end

  post '/chitter/new' do
    @peep = Peep.all
  end

  get 'chitter/new' do
    erb :'stream/new'
  end

  run! if app_file == $0
end
