require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/chitter' do
    @chitter = Chitter.all
    erb :chitter
  end 

  run! if app_file == $0
end
