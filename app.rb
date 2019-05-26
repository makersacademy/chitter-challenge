require 'sinatra/base'
require './lib/chitter'

class ChitterFeed < Sinatra::Base

  # enable :method_override

  get '/' do
    @chitter_feed = Chitter.all
    erb :index
  end

  get '/new_peep' do
    erb :new_peep
  end

  post '/new_peep/add' do
    Chitter.create(message: params[:message])
    p params
    redirect '/'
  end

  # delete '/bookmarks/:id' do
  #   Bookmark.delete(id: params[:id])
  #   redirect '/bookmarks'
  # end

end