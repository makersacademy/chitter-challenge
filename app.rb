require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/new-peep' do
    Peep.create(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
