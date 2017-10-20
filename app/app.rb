require 'sinatra/base'
require_relative 'models/post'

class Fitter < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  run! if app_file == $0
end
