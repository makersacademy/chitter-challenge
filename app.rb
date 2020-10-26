require 'sinatra/base'
require './lib/peeps'
require './database_connection_setup.rb'

class  Chitter < Sinatra::Base

  get '/' do
    @messages = Peeps.all
    erb :index
  end

  post '/' do 
    peep = params[:peep]
    Peeps.add(peep)
    redirect('/')
  end







  run! if app_file == $0
end