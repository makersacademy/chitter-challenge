require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    'Hello world!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  run! if app_file == $0

end
