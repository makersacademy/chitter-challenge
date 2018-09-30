require 'sinatra/base'

require_relative 'data_mapper_setup.rb'
require_relative 'lib/peep'

class ChitterApp < Sinatra::Base
    get '/' do
        'Hello world'
    end

    post '/chitter' do
        Peep.new(params["peep"])
    end

    get '/chitter/peep' do
        erb :peep
    end

    run! if app_file == $0
end
