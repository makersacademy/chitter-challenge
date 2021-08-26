require './config/environment'
require './lib/user'
# require_relative './lib/peep'
require 'sinatra/base'
require 'sinatra'
require 'sinatra/reloader'

class Zwitscher < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @users = User.all
    erb :'zwitscher/index'
  end

  # post '/peep' do
  #   redirect '/zwitscher/read'
  # end

  # get '/zwitscher/read' do
  #   erb :'zwitscher/read_peeps'
  # end

  run! if app_file == $0
end
