require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

get '/' do
  'Hello and Welcome to the Chitter app!'
end

get '/peeps' do
  peeps = [
      'Hello I am a peep!',
      'I too am a peep!'
      ]
end


  run! if app_file == $0
end