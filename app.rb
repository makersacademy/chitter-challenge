require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require 'uri'

class ChitterClallenge < Sinatra::Base
    
    register Sinatra::Flash
    enable :sessions


    get '/' do
        @peeps = Peep.read
        erb :index
    end

    
    post '/' do
        oops = 'you peeped too long!'
        flash[:notice] = oops unless Peep.create(peep: params['peep'])
        redirect '/'
    end


    error 404 do
        '404'
    end


    run! if app_file == $PROGRAM_NAME

end
