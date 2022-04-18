require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
end

  get '/' do
    'Hello World'
  end

  get '/chitter/peeps' do
    'Chitter Challenge'  
  end
  


  run! if app_file == $0
end