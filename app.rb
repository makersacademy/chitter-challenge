require 'sinatra/base'
require_relative 'lib/messages'

  class Chitter < Sinatra::Base

    get '/' do 
      
      @messages = Messages.get_all
      erb(:index)
    end 

    run if app_file == $0
end 