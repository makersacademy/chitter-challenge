require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/signup' do
    'My Way'
  end

  run! if app_file == $0
end