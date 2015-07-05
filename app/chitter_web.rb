require 'sinatra/base'
require './data_mapper_setup'

class ChitterWeb < Sinatra::Base
  set :views, proc { File.join(root, 'views') }

  get '/' do
    'Hello ChitterWeb!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
