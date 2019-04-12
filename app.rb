require 'sinatra/base'
require './lib/post'

class Chitter < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
