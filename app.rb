require 'sinatra/base'


class App < Sinatra::Base

  get ('/') do
    'Chitter'
  end





  run! if app_file == $0
end
