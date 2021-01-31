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
    if session[:session_user_id]
      @user = User.find(session[:session_user_id])
    end
    erb :index
  end

  post "/new_post/:id" do
    post = Post.new("text": params["post"]["text"], "user_id": params["id"])
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
                    "password_digest": encrypted_password,
                    "real_name": params[:real_name],
                    "username": params["username"])
    if user.save
      redirect "/"
    else
      "failed to create a user!"
    end
  end

  get "/sessions/new" do
    erb :"sessions/new"
  end

  post "/sessions" do
    user = User.where("email": params["email"]).first
    if user.authenticate(params["password"])
      session[:session_user_id] = user.id
      redirect "/"
    else
      "no good!"
    end
  end

  run! if app_file == $0
end
