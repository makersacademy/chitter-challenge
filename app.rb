require 'sinatra/base'

class Chitter < Sinatra::Base 

  get '/' do 
    'This is the opening page for Chitter'
  end 

  run! if app_file == $0 
end 