require 'sinatra'
require 'data_mapper'
env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base
  get '/' do
   @posts = Post.all
   erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
