
require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do

    "Chitter"
  end

  get '/feed' do
    @peeps = Peep.all
    erb :index
  end


  run! if app_file == $0
end
