
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: "sqlite3", database: "foo.sqlit3" }

class Chitter < Sinatra::Base
  registeer Sinatra::ActiveRecordExtension
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  run! if app_file == $0
end




