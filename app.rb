require 'sinatra/base'
require 'sinatra/reloader'

require './lib/peep'



class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb :'chitter/index'
  end

  post '/chitter' do
    redirect '/chitter'
  end 

    run! if app_file == $0
  
end