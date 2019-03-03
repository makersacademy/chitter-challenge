ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class Chitter < Sinatra::Base 

  get '/' do
    "WELCOME TO CHITTER"
    erb :index
  end


  run! if app_file == $0
end 
