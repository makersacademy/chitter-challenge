require 'sinatra/base'
require './lib/chitter'

class ChitterManager < Sinatra::Base
  get '/' do
    erb :'chitter/index'
  end

  get '/chitter' do
    @chitter = Chitter.all
    erb :'chitter/post'
  end

  run! if app_file == $0
end
