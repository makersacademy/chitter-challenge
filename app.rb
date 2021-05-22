require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chirps'

class Chitter < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end
    enable :sessions, :method_override

    get '/chirps' do
        @chirps = Chirps.all
        erb(:'chirps/index')
    end

    get '/chirps/new' do
        erb(:'chirps/new')
    end

    post '/chirps' do
        Chirps.create(chirp: params[:chirp], title: params[:title])
        redirect('/chirps')
    end

    delete '/chirps/:id' do
        Chirps.delete(id: params[:id])
        redirect '/chirps'
    end

    run! if app_file == $0
end