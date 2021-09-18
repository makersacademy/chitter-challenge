require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter_feed'

class ChitterApp < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
    erb(:index)
  end

  get '/feed' do 
    @feed = ChitterFeed.all
    erb(:feedpage)
  end

  post '/feed' do 
    p params 
    p "Form data submitted to the feed route"
    message = params['peep']
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO chitter (message) VALUES('#{message}')")
    redirect '/feed'
  end 

  get '/feed/comment' do 
    erb(:addcomment)
  end


  run! if app_file == $0

end
