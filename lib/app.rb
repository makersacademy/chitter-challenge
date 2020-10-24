require 'sinatra/base'
require './lib/model/peep'


class Chitter < Sinatra::Base

  get '/' do
    'Hello World!'
  end

  get '/peep' do
    @peeps = Peep.all
    erb :index
  end


  run! if app_file == $0
end
