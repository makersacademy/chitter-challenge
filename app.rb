require 'sinatra/base'
require 'sinatra/flash'

class Bitter <Sinatra::Base
  register Sinatra::Flash

  get '/beets' do
    'Bitter'
  end

  run! if app_file == $0
end