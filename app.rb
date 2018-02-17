require 'sinatra'
require 'sinatra/base'
# require 'sinatra/flash'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions  

  get "/" do
    @peeps = Peep.all
    erb(:index)    
  end

  post "/peeps/new" do
    @peeps = Peep.all    
    # @new_peep = params[:peep]
    # Peep.create(@new_peep)
    Peep.create(params['peep'])
    erb(:index)    
    redirect("/")
  end

end
