require 'bcrypt'
require 'sinatra/base'
require './lib/chitterfeed.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @feed = ChitterFeed.view
    @feed.reverse!
    erb :homepage
  end

  post '/post-message' do
    ChitterFeed.add(params[:content], session[:userid] = 1)
    redirect '/'
  end

  post '/sign-up' do
    User.add(params[:name], params[:username], params[:email], params[:psw])
    redirect '/'
  end

  get '/register' do
    erb :register
  end

  run! if app_file == $0

end