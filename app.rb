require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter Homepage'
  end

  get '/new' do
    erb :new
  end

  run! if app_file == $0
end
