require 'dm-postgres-adapter'
require "sinatra"
require "sinatra/base"
require "sinatra/reloader" if development?

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
    #DataMapper.auto_upgrade!
  end

  get '/' do
    'Hello World'
    #erb :index
  end 

  run! if app_file == $0
end
