require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

class Application < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get "/" do
    "Hello World"
  end
end
