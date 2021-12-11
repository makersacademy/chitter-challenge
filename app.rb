require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitterapp'
# require './live/peep'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
    
  end

  run! if app_file == $0
end