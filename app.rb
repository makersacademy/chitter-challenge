require 'sinatra/base'
require './lib/chitter.rb'

class ChitterBox < Sinatra::Base


  
  get '/' do
    @posts = Chitter.all
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end