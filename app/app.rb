require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb(:peep)
  end

  post '/peep' do
    @peeps = Peeps.all
    erb :list_peeps
  end


  run! if app_file == $0
end
