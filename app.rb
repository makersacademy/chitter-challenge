require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base

  get '/' do
    "Log in to Chitter"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
