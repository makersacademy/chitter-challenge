ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
# require 'sinatra/flash'
# require 'sinatra/partial'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, 'static') }

  get '/' do
    'Hello Chitter!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
