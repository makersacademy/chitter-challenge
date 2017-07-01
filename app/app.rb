
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative "./models/post"

class Chitter < Sinatra::Base
  get '/' do
    Post.create
  end
end
