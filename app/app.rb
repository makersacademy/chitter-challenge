require 'sinatra/base'
require './app/lib/peep'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $0
end
