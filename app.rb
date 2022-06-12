require 'sinatra/base'
require 'sinatra/reloader'

class Chittermanager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    erb :'chitter/index'
  end

  run! if app_file == $0
end
