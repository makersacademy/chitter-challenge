require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/chitter' do
    "Chitter!!"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  # establish server if file run directly
  run! if app_file == $0
end
