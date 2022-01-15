require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps' do
   p @peeps = Peep.all 
    erb :'peeps/index'
  end

  get '/' do
    'Welcome to Chitter'
  end

  run! if app_file == $0
end