require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb:'chitter/index'
  end

  run! if app_file == $0
end