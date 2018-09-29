require 'sinatra/base'

require_relative 'data_mapper_setup.rb'

class ChitterApp < Sinatra::Base 
    get '/' do 
        'Hello world'
    end

    run! if app_file == $0
end