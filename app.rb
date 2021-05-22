# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'rack'
require './lib/quack'

# DuckBoard class is the controller
class DuckBoard < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @quacks = Quack.all
    erb :index
  end

  post '/name' do
    session[:display_name] = params[:display_name]
    redirect '/compose_quack'
  end

  get '/compose_quack' do
    @display_name = session[:display_name]
    @quacks = Quack.all
    erb :compose_quack
  end

  post '/message' do
    session[:message] = params[:message]
    # code to pass session message and display_name to model to insert to db
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
