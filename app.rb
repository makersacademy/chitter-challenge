require 'sinatra/base'
require 'sinatra/reloader'
require './lib/post'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/posts' do
    @posts = Post.all 
    erb :'posts/index'
  end

  get '/' do
    'Welcome to Chitter'
  end

  run! if app_file == $0
end