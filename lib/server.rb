require 'sinatra/base'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

    set :views, proc { File.join(root, '..', 'views') }
  
  get '/' do
    @links = Link.all
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
