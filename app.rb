require 'sinatra/base'
require './lib/chitter'

class ChitterChallenge < Sinatra::Base

  get '/' do
    "Chitter Challenge!"
  end

  get '/chitter' do
    @chitters = Chitter.all
    erb :index
  end


  run if app_file == $0
end
