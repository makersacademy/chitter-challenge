require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  DatabaseConnection.setup("chitter")

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/post-peep' do
    Peep.create(params[:peep])
    redirect('/')
  end

end
