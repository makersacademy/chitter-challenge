require 'sinatra/base'
require 'sinatra/flash'

class Bitter <Sinatra::Base
  register Sinatra::Flash

  get '/beets' do
    erb(:beets)
  end

  get '/new_beet' do
    erb(:new_beet)
  end

  run! if app_file == $0
end