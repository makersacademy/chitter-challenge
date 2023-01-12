require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

class Application < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Reloader
    #change below
    # also_reload "lib/album_repository"
    # also_reload "lib/artist_repository"
  end
end
