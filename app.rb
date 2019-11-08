require 'sinatra/base'
require 'sinatra/flash'

class Bitter <Sinatra::Base
  register Sinatra::Flash

  get '/beets' do
    erb(:beets)
  end

  run! if app_file == $0
end