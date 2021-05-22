require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chirps'
require_relative './lib/comment'
require_relative './database_connection_setup'

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

    get '/chirps/:id/edit' do
        @chirp = Chirps.find(id: params[:id])
        erb(:'chirps/edit')
    end

    patch '/chirps/:id' do
        Chirps.update(id: params[:id], title: params[:title], chirp: params[:chirp])
        redirect('/chirps')
    end

    get '/chirps/:id/comments/new' do
        @chirp_id = params[:id]
        erb :'comments/new'
    end

    post '/chirps/:id/comments' do
        Comment.create(text: params[:comment], chirp_id: params[:id])
        redirect '/chirps'
    end

    run! if app_file == $0
end