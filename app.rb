require 'sinatra/base'

require_relative './database_setup.rb'
require_relative './lib/peep.rb'

class ChitterApp < Sinatra::Base

    get '/' do
        erb(:index)
    end

    post '/new' do
       Peep.add_peeps(params['message'])
       redirect '/'
    end

end
