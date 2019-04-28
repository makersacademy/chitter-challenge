require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/stream' do
    erb :index
  end

  run! if app_file == $0
end
