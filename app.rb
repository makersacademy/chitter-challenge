require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter_feed'

class ChitterApp < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
    erb(:index)
  end

  get '/feed' do 
    ['Hello World', 
    'Hello Chitter']
  end

  run! if app_file == $0

end
