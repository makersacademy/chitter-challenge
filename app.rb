require 'sinatra/base'
require './lib/cheeter'
require './database_connection_setup'

class Cheeter < Sinatra::Base


  get '/' do
    erb :index
  end

  post '/first_peep' do
    @cheet = params[:peep]
    @peeps = Peep.all
    erb :add_post
  end

end
