require_relative './lib/peep'
require 'data_mapper'
require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base 
  
  get '/' do
    "WELCOME TO CHITTER"
    erb :index
    @all_peeps = Peep.all
  end

  run! if app_file == $0
end 
