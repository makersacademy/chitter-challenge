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
    ChitterFeed.post(peep: params[:peep])
    redirect '/feed'
  end 

  get '/feed/comment' do 
    erb(:addcomment)
  end


  run! if app_file == $0

end
