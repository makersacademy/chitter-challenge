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
    erb :homepage
  end

  get '/peep' do
    erb :create_peep
  end

  post '/peep' do
    
    redirect '/homepage'
  end


  run! if app_file == $0
end