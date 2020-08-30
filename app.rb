require 'sinatra/base'

require_relative './database_setup.rb'

class ChitterApp < Sinatra::Base

    get '/' do
        "Chitter"
    end


end
