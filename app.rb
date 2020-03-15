require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Testing infrastructure'
  end

  get '/' do
    "Chitter"
  end

  get '/view-peeps' do
    @peeps = Peeps.all
    erb :"view-peeps"
  end

  run! if app_file == $0
end
