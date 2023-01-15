require "sinatra"
require "bcrypt"
require "sinatra/reloader"
require "sinatra/activerecord"
require_relative "lib/posts"
require_relative "lib/replies"
require_relative "lib/users"
require_relative "lib/mail"
require_relative "lib/secure"

class Application < Sinatra::Base
  configure :development do
    enable :sessions
    register Sinatra::ActiveRecordExtension
    register Sinatra::Reloader
  end

  get "/" do
    all_posts
    redirect "/account" if session_check
    return erb(:homepage)
  end

  get "/sign-up" do
    return erb(:signup)
  end

  post "/login" do
    return erb(:signedin) if log_in
    return erb(:signinfailed)
  end

  post "/sign-up" do
    sign_up
  end

  post "/create-post" do
    return redirect("/") if !session_check
    create_post
    redirect "/account"
  end

  get "/account" do
    all_posts
    return erb(:account) if session_check

    return redirect("/")
  end

  get "/replies/:id&:username&:content&:created_at" do
    all_replies
    return erb(:allreplies_signedin) if session_check

    return erb(:allreplies)
  end

  post "/reply/:id" do
    return redirect("/") if !session_check
    create_reply
    redirect back
  end

  post "/logout" do
    session.clear
    return erb(:logout)
  end

  private

  def sign_up
    return erb(:missingitems) if params[:first_name].secure.empty? ||
                                 params[:surname].secure.empty? ||
                                 params[:email].secure.empty? ||
                                 params[:username].secure.empty? ||
                                 params[:password].secure.empty?
    encrypted_password = BCrypt::Password.create(params[:password])
    @user = User.create(first_name: params[:first_name].secure,
                        surname: params[:surname].secure,
                        email: params[:email].secure,
                        username: params[:username].secure,
                        password_digest: encrypted_password)

    if @user.errors.empty?
      return erb(:signedup)
    else
      @error = true
      return erb(:signupfailled)
    end
  end

  def log_in
    user = User.find_by(username: params[:username].secure)
    return false if user.nil?
    if BCrypt::Password.new(user.password_digest) == params[:password]
      session[:user_id] = user.id
      return true
    else
      return false
    end
  end

  def all_posts
    @p = User.order("created_at DESC").joins(:posts).select("posts.id AS po_id, users.*, posts.*")
  end

  def create_reply
    redirect back if params[:content] == ""
    Reply.create(user_id: session[:user_id], post_id: params[:id], content: params[:content].secure)
    check_tag(params[:content])
  end

  def create_post
    redirect back if params[:content] == ""
    Post.create(user_id: session[:user_id], content: params[:content].secure)
    check_tag(params[:content])
  end

  def all_replies
    @w = [params[:username], params[:content], params[:created_at], params[:id]]
    @t = User.joins(:replies).select("users.*, replies.*").where("replies.post_id" => params[:id])
  end

  def check_tag(content)
    name = content.split.select { |b| b.include?("@") }.join.tr("@", "")
    user = User.find_by(username: name)
    return "" if user.nil?
    new_email = EmailTag.new
    new_email.send(user.email)
  end

  def session_check
    return false if session[:user_id] == nil

    return session[:user_id]
  end
end
