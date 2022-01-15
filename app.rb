require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterManager < Sinatra::Base 
    configure :development do 
        register Sinatra::Reloader
    end 

    get '/chitter' do
        @peeps = Chitter.all
        erb :'chitter/index'
    end

    run! if app_file == $0
end 

    