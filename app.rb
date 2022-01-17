# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'rack'
require './lib/chitter'

# DuckBoard class is the controller
class ChitterBoard < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @cheets = Chitter.all
    erb :index
  end

  post '/name' do
    session[:display_name] = params[:display_name]
    redirect '/compose_cheet'
  end

  get '/compose_cheet' do
    @display_name = session[:display_name]
    @cheets = Chitter.all
    erb :compose_cheet
  end

  post '/message' do
    Chitter.create(message: params[:message], display_name: session[:display_name])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME

end
