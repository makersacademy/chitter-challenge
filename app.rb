require 'sinatra/base'
require './lib/peeps.rb'

class Chitter < Sinatra::Base

  get '/' do 
    @peeps = Peeps.all
    erb(:index)
  end 

  post '/' do 
    peep = params[:add_peep]
    Peeps.post(peep)
    redirect '/'
  end 

end 