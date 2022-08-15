require 'sinatra/base'
require 'sinatra/reloader'
require 'lib/peep'

class Chitter < Sinatra::Base

    get '/' do
        erb :index
    end

    get '/' do
      @bookmarks = Bookmark.all
      erb :index
    end

  run! if app_file == $0
end