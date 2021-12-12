require 'sinatra/base'
require 'sinatra/reloader'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    @peeps = [
      'Example peep posted at 3pm',
      'Example peep posted at 2pm',
      'Example peep posted at 1pm'
    ]
    erb :'home/index'
  end 

  post '/home' do
    'this is my first peep'
  end 

run if app_file == $0 
end