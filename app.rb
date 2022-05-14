
require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/chit'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # get '/' do
  #   erb :index
  # end

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  run! if app_file == $0
end
