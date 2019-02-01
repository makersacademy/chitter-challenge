require 'sinatra'
require './app/models/peep'
require 'dm-postgres-adapter'
require 'data_mapper'
requre '../models/peep'

class Shitter < Sinatra::Base

  # before do
  #   @game = Game.instance
  # end

  configure do
    DataMapper.setup :default, "/postgres://localhost/shitter.db"
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/' do
    "Welcome to Shitter!"
    # reserve for loging in or signing up
  end

  get '/peeps' do
    Peep.create
    erb :index
  end

  post '/peeps' do
    redirect '/peeps'
  end

end
