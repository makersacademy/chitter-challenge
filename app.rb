require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/view' do
    @peeps = Peep.all
    erb :'/view'
  end




  run! if app_file == $0
end
