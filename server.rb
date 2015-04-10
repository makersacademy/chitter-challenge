require 'sinatra/base'
require 'data_mapper'
require_relative 'lib/post'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './lib/post'
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  get '/test' do
   @posts = Post.all
   erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
