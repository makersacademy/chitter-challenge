require 'sinatra/base'
# require './lib/bookmark'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/post_peep' do
    redirect '/peeps'
  end
  #
  # get '/bookmarks' do
  #   @bookmarks = Bookmark.all
  #   erb :bookmarks
  # end
  #
  # post '/add_bookmark' do
  #   redirect '/new_bookmark'
  # end
  #
  # get '/new_bookmark' do
  #   erb :new_bookmark
  # end
  #
  # post '/bookmark_added' do
  #   Bookmark.add(params[:TITLE], params[:URL])
  #   redirect '/bookmarks'
  # end

  run! if app_file == $0

end
