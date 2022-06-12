require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter Chatter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end 


  run! if app_file == $0
end