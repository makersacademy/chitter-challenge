require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :develpment do
    register Sinatra::Reloader
  end

  get '/chitter' do
    erb(:'chitter/index')
  end

  run if app_file == $0
end
