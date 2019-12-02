require 'sinatra/base'
# require './lib/chitter.rb'
class Chitter < Sinatra::Base

  enable :sessions  #Enables use of session[:hash] for storing data

  get '/' do
    "Hello World"
  end

end
