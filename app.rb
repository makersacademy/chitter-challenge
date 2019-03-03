require "sinatra/base"
require "pg"
require_relative "./lib/post.rb"
class Chiter < Sinatra::Base
  enable :sessions
  get "/posts" do
    @result = Post.all
    erb :index
  end

  get "/posts/new" do
    erb :"/posts/new"
  end

  post "/posts/new" do
    @text = params[:text]
    Post.create(@text)
    redirect "/posts"
  end

  run! if app_file == $0
end
