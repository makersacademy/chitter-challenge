require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/signup' do
    erb(:signup)
  end

  run! if app_file == $0
end