require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end
  
  post '/peep' do
    erb :new_peep
  end


  run! if app_file == $0
end