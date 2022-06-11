require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Welcome to Chitter!"
  end

  get '/chits' do
    @chits = [
      "My first chit",
      "Look ma, I'm chitting",
    ]
    erb :'chits/index'
  end

  run! if app_file == $0
end
