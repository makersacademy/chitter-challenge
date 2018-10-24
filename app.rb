require 'sinatra/base'

class App < Sinatra::Base

  get '/chitter' do
    erb(:index)
  end
  

  run! if app_file == $0
end
