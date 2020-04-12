require 'sinatra/base'
require './lib/peeps.rb'
require './database_connection_setup.rb'

class Chitter < Sinatra::Base

  get '/' do
    @messages = Peeps.all
    erb :index
  end

  post '/' do 
    peep = params[:peep]
    Peeps.add(peep)
    redirect('/')
  end

end
