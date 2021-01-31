
require "sinatra/base"
require "sinatra/activerecord"
require_relative "lib/post"

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions

  get "/" do
    @posts = Post.all
    erb :index
  end

  post "/new_post" do
    post = Post.new(params["post"])
    if post.save
      redirect "/"
    else
      "failed!"
    end
  end

  get "/:id" do
    post = Post.find(params[:id])
    "#{post.text}, #{post.author_name}, #{post.created_at}"
  end


  run! if app_file == $0
end
