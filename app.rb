require "sinatra/base"
require "sinatra/reloader"
require_relative "lib/database_connection"
require_relative "lib/user_repository"
require_relative "lib/post_repository"

DatabaseConnection.connect("chitter_test")

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get "/" do
    post_repo = PostRepository.new
    @posts = post_repo.all.sort { |post| DateTime.parse(post.time) }
    return erb(:index)
  end

  get "/signup" do
    return erb(:signup)
  end

  post "/new_user" do
    name = params[:name]
    email = params[:email]
    username = params[:username]
    password = params[:password]

    if UserRepository.new.find_by_email(email) == nil
      @new_user = User.new
      @new_user.name = name
      @new_user.email = email
      @new_user.username = username
      @new_user.password = password

      @user_repo = UserRepository.new
      @user_repo.create(@new_user)

      return erb(:signup_confirmation)
    else
      return erb(:signup_error)
    end
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

  get "/login" do
    return erb(:login)
  end

  post "/login" do
    email = params[:email]
    password = params[:password]

    if UserRepository.new.find_by_email(email) == nil
      return erb(:login_error)
    end

    user_repo = UserRepository.new
    @user = user_repo.find_by_email(email)

    if @user.password == password
      # Set the user ID in session
      session[:user_id] = @user.id
      p @user.id

      return erb(:login_success)
    else
      return erb(:login_error)
    end
  end

  get "/account_page" do
    if session[:user_id] == nil
      # return redirect('/login')
      return "whoops"
    else
      @user = UserRepository.new.find(session[:user_id])
      post_repo = PostRepository.new
      @posts = post_repo.all.sort { |post| DateTime.parse(post.time) }
      return erb(:user_chitter)
    end
  end
end
