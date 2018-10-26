require 'sinatra/base'
require './lib/peep'

class ChitterManager < Sinatra::Base
  get '/' do
    'Chitter'
  end

  get '/peeps' do
    p ENV

    @peeps = Peep.all
    erb :'index'
  end

  run! if app_file == $0
end
