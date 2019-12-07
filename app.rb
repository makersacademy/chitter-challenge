require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb:'homepage'
  end

  get '/register' do
    erb:'register'
  end

  run! if app_file == $0
end
