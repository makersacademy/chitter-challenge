require 'sinatra/base'
require './lib/peep'

class PeepManager < Sinatra::Base
  get '/' do
    erb :'index'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  run! if app_file == $0

end
