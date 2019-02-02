require 'pg'
require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    p @peeps
    # p @peeps[0]
    # p @peeps[0]['peep']
    erb :index
  end

  post '/process-peep' do
    Peep.create(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
