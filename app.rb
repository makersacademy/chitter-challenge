require 'sinatra/base'
require './lib/peeps'

class Peep < Sinatra::Base
  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
