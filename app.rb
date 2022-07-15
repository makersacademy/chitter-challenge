require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/post_repository'

DatabaseConnection.connect("chitter_test")

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  #your pathways go here

  get "/" do
    post_repo = PostRepository.new
    @posts = post_repo.all.sort { |post| DateTime.parse(post.time) }
    return erb(:index)
  end

  get "/signup" do
    return erb(:signup)
  end

  get "/home/:id" do
    user_id = params[:id]
    user_repo = UserRepository.new
    @user = user_repo.find(user_id)
    

    post_repo = PostRepository.new
    @posts = post_repo.all.sort {|post| DateTime.parse(post.time)}
    return erb(:user_chitter)
  end

  post "/new_user" do
    name = params[:name]
    email = params[:email]
    username = params[:username]
    password = params[:password]

    @new_user = User.new
    @new_user.name = name
    @new_user.email = email
    @new_user.username = username
    @new_user.password = password

    @user_repo = UserRepository.new
    @user_repo.create(@new_user)

   
    # return user_repo.all.last.id
    return erb(:signup_confirmation)
  end

  post "/new_post" do
    @post = Post.new
    @post.content = params[:content]
    @post.time = params[:time]
    @post.user_id = params[:user_id].to_i

    post_repo = PostRepository.new
    post_repo.create(@post)

    return erb(:new_post_confirmation)
  end






end