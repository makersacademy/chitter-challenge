require 'sinatra/base'
require './lib/feed'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  $feed = Feed.new

  get '/' do
    erb :index
  end

  get '/feed' do
    erb :feed
  end

  post '/signup' do
    $user = User.create(name: params[:username], password: params[:password])
    redirect '/feed'
  end

  post '/feed' do
    $feed.add_peep(Peep.create(text: params[:peep]))
    redirect '/feed'
  end

  run if app_file == $0
end
