require "sinatra"
require "bcrypt"
require "sinatra/reloader"
require "sinatra/activerecord"
require_relative "lib/posts"
require_relative "lib/replies"
require_relative "lib/users"

class Application < Sinatra::Base
  configure :development do
    enable :sessions
    register Sinatra::ActiveRecordExtension
    register Sinatra::Reloader
  end

  get "/" do
    @p = User.order("created_at DESC").joins(:posts).select("users.*, posts.*")

    return erb(:homepage)
  end

  get "/sign-up" do
    return erb(:signup)
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    return erb(:signinfailed) if user.nil?
    if BCrypt::Password.new(user.password_digest) == params[:password]
      session[:user_id] = user.id
      return erb(:signedin)
    else
      return erb(:signinfailed)
    end
  end

  post "/sign-up" do
    encrypted_password = BCrypt::Password.create(params[:password])
    User.create(first_name: params[:first_name], surname: params[:surname], email: params[:email], username: params[:username], password_digest: encrypted_password)
    return erb(:signedup)
  end

  post "/create-post" do
    return redirect("/") if session[:user_id] == nil
    Post.create(user_id: session[:user_id], content: params[:content])
    redirect "/account"
  end

  get "/account" do
    if session[:user_id] == nil
      return redirect("/")
    else
      @p = User.order("created_at DESC").joins(:posts).select("users.*, posts.*")
      return erb(:account)
    end
  end

  get "/replies/:id" do
    @t = User.joins(:posts, :replies).select("users.username, posts.content, replies.content")
    return erb(:allreplies)
  end

  post "/reply" do
    return redirect("/") if session[:user_id] == nil
    Reply.create(user_id: session[:user_id], post_id: params[:post_id], content: params[:content])
    return ""
  end

  post "/logout" do
    session.clear
    return erb(:logout)
  end

  private

  def mail
  end

  def secure
  end
end
