require "sinatra/base"
require "sinatra/activerecord"
require "bcrypt"

require_relative "lib/post"
require_relative "lib/user"


class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions

  get "/" do
    @posts = Post.all.order(created_at: :desc)
    erb :index
  end

  post "/new_post" do
    post = Post.new(params["post"])
    if post.save
      redirect "/"
    else
      "failed to create a post!"
    end
  end

  get "/new_user" do
    erb :registration
  end

  post "/new_user" do
    encrypted_password = BCrypt::Password.create(params["password"])
    user = User.new("email": params["email"],
                    "password": encrypted_password,
                    "real_name": params[:real_name],
                    "username": params["username"])
    if user.save
      redirect "/"
    else
      "failed to create a user!"
    end
  end


  run! if app_file == $0
end
