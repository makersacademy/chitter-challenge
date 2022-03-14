require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  # get '/bookmarks' do

  #   @bookmarks = Bookmark.all
  #   erb :'bookmarks/index'

  # end



  run! if app_file == $0
end