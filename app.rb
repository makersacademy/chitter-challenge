require 'sinatra'
require 'sinatra/activerecord'

set :database_file, 'config/database.yml'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do
    'Hello world!'
  end

  run! if app_file == $0

end