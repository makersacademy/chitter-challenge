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

    get '/chirps/new' do
        erb(:'chirps/new')
    end

    post '/chirps' do
        # chirp = params['chirp']
        # connection = PG.connect(dbname: 'chitter_test')
        # connection.exec("INSERT INTO chirps (chirp) VALUES('#{chirp}')")
        Chirps.create(chirp: params[:chirp])
        redirect('/chirps')
    end

    run! if app_file == $0
end