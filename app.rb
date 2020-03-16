require 'sinatra/base'
require './lib/post'

class Chitter < Sinatra::Base
  get '/posts' do
    @posts = Post.all
    
    erb :'posts/index'
  end

  run! if app_file == $0
end
