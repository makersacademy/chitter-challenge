require 'sinatra/base'

class ChitterChallenge < Sinatra::Base

  get '/' do
    "Chitter Challenge!"
  end

  get '/chitter' do
    erb :index
  end


  run if app_file == $0
end
