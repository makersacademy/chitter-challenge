require "sinatra/base"
require "sinatra/reloader"
require "sinatra/activerecord"

require_relative "./models/user"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @users = User.all

    return erb(:index)
  end
end
