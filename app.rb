require "sinatra/base"
require "sinatra/reloader"
require "sinatra/activerecord"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "hello world"
  end
end
