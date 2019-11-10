require 'sinatra/base'
require './lib/feed'

class Chitter < Sinatra::Base

  $feed = Feed.new

  get '/' do
    erb :feed
  end

  post '/feed' do
#   $feed << params[:peep]
    $feed.add_peep(Peep.create(text: params[:peep]))
    redirect '/'
  end

  run if app_file == $0
end
