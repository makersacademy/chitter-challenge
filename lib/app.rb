require 'sinatra/base'
require_relative 'posts'

class PostsManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/posts' do
    @posts = Posts.new.print_all
    erb(:posts)
  end

  post '/add-post' do
    redirect to '/post-submited'
  end

  get '/post-submited' do
    @posts = Posts.new.print_all
    erb(:posts)
  end

  run! if app_file == $0
end
