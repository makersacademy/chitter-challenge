require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter_feed.rb'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end

  post '/homepage' do 
    @name = params[:name]
    @peep = params[:peep]
    connection= PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO chitter_feed (peep) VALUES('#{@peep}')")
    @chitter_feed = ChitterFeed.all
    erb :homepage
  end

  get '/chitter_feed' do 
    @chitter_feed = ChitterFeed.all
    erb :homepage
  end

  run! if app_file == $0
end
