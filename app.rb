require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/' do
    Peep.create(peep: params["peep"], name: params["name"], username: params["@username"], time: params["time"])
    redirect to('/')
  end



  run! if app_file == $0
end