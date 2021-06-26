require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'
require './lib/tweet'
require 'date'
require 'uri'
require './lib/database_connection.rb'
require_relative './lib/database_connection_setup'

class ChitterChat < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  before do
    @chitter = Chitter.all
  end

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/tweets' do
    Chitter.add(tweet: params[:tweet], time: Time.new.strftime("%k:%M %p"))
    erb :index
  end

  post '/index' do
    erb :index
  end

  run! if app_file == $0
end