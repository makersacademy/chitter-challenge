require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  DatabaseConnection.setup

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/new_peep' do
    Peep.create(params[:new_peep])
    redirect '/'
  end

end
