require 'sinatra/base'

require_relative 'data_mapper_setup.rb'
require_relative 'lib/peep'

class ChitterApp < Sinatra::Base

    setup_databases

    get '/' do
        'Hello world'
    end

    get '/chitter' do
      @peeps = Peep.all.reverse
      erb :chitter_homepage
    end

    post '/chitter' do
        Peep.create(text: params["peep"])
        redirect '/chitter'
    end

    get '/chitter/peep' do
        erb :peep
    end

    run! if app_file == $0
end
