require 'sinatra'
require './lib/posts.rb'

class Chitter < Sinatra::Base

  get '/' do
    @post = Posts.show
    erb :index
  end

  run! if app_file == $0

end
