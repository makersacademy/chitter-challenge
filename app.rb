require 'sinatra/base'
require 'sinatra/reloader'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    @peeps = Peep.all
    erb :'home/index'
  end 

  post '/home' do
    'this is my first peep'
  end 

run if app_file == $0 
end