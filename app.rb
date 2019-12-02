require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  run! if app_file == $0

end
