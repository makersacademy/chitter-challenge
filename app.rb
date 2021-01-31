
require "sinatra/base"
require "sinatra/activerecord"
require_relative "lib/post"

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions

  get "/" do
    erb :index
  end

  post "/new_post" do
    p params
    post = Post.new(params["post"])
    if post.save
      redirect "/#{post.id}"
    else
      "failed!"
    end
  end

  get "/:id" do
    post = Post.find(params[:id])
    "#{post.text}, #{post.author_name}"
  end


  run! if app_file == $0
end
