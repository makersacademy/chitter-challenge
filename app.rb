require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter_feed'

class ChitterApp < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader
  end

  enable :sessions

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

  get '/signup' do 
    erb(:signup)
  end

  post '/user' do 
    #ChitterFeed.post(peep: params[:peep])
    session[:user_name] = params[:user_name]
    p session[:user_name]
    # @username = params[:user_name]
    # p @username
    redirect '/user/homepage'
  end

  get '/user/homepage' do 
    @username = session[:user_name]
    erb(:userhomepage)
  end 

  run! if app_file == $0

end
