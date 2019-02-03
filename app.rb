require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/cheets' do
    @cheets = Cheet.all
    erb :cheets
  end

  run! if app_file == $0
end
