require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'
require_relative './lib/chirps'
require_relative './lib/comment'
require_relative './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end
    register Sinatra::Flash
    enable :sessions, :method_override

    get '/' do
        erb(:'home')
    end

    get '/chirps' do
        @user = User.find(id: session[:user_id])
        @chirps = Chirps.all
        erb(:'chirps/index')
    end

    get '/chirps/new' do
        erb(:'chirps/new')
    end

    post '/chirps' do
        Chirps.create(chirp: params[:chirp], title: params[:title], image: params[:image])
        redirect('/chirps')
    end

    delete '/chirps/:id' do
        Comment.delete(chirp_id: params[:id])
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

    get '/users/new' do
        erb :"users/new"
    end

    post '/users' do
        user = User.create(name: params[:name], email: params[:email], password: params[:password])
        session[:user_id] = user.id
        redirect '/chirps'
    end

    get '/sessions/new' do
        erb :"sessions/new"
    end

    post '/sessions' do
        user = User.authenticate(email: params[:email], password: params[:password])
        if user
            session[:user_id] = user.id
            redirect('/chirps')
        else
            flash[:notice] = 'Please check your email or password.'
            redirect('/sessions/new')
        end
    end

    post '/sessions/destroy' do
        session.clear
        flash[:notice] = 'You have signed out.'
        redirect('/chirps')
    end

    run! if app_file == $0
end