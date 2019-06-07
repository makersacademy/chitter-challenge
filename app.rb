require 'bcrypt'
require 'sinatra/base'
require './lib/chitterfeed.rb'

class Chitter < Sinatra::Base

  get '/' do
    @feed = ChitterFeed.view
    @feed.reverse!
    erb :homepage
  end

  post '/post-message' do
    ChitterFeed.add(params[:content])
    redirect '/'
  end

  post '/sign-up' do
    redirect '/'
  end

  get '/register' do
    erb :register
  end

  run! if app_file == $0

end