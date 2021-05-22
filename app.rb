require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end

    get '/chirps' do
        @chirps = Chirps.all
        erb(:'chirps/index')
    end

    run! if app_file == $0
end