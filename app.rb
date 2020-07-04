require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
