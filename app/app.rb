
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative './models/post'
require_relative './data_mapper_config'

class Chitter < Sinatra::Base
  get '/' do
    Post.create
  end
end
