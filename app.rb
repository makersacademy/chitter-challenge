require 'sinatra/base'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :'chitter/index'
  end

  post '/add_peep' do
    Peep.create(message: params[:peep])
    redirect '/chitter'
  end

  run! if app_file == $0
end
