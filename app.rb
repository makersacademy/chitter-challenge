require 'sinatra/base'

# controller
class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/message/new' do
    erb :compose
  end

  run! if app_file == $0
end
