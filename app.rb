require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
    erb :index
  end
  get '/peep' do
    @peep = [
                  "Hello Makers",
                  "This weekend challenege is fun"
             ]
  
    erb :'index'
  end
  get '/peep' do
    @peep = Peep.get(:all)
    erb :'index'
  end
  run! if app_file == $0
end