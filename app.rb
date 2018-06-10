require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require 'uri'

class ChitterClallenge < Sinatra::Base
    
    register Sinatra::Flash
    enable :sessions


    get '/' do
        @peeps = Peep.read
        erb :'index'
    end

    post '/' do
        Peep.create(peep: params['peep'])
        redirect '/'
    end


    run! if app_file == $PROGRAM_NAME

end