require 'sinatra/base'
require_relative 'models/post'

class Blabber < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    erb(:'posts/index')
  end

end
