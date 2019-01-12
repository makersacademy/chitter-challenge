require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'

set :database_file, 'config/database.yml'

class Warble < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  get '/' do
    'Home'
  end

  run! if app_file == $0

end
