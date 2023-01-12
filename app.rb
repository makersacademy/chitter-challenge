require "sinatra"
require "bcrypt"
require "sinatra/reloader"
require "sinatra/activerecord"
require_relative "lib/posts"
require_relative "lib/replies"
require_relative "lib/users"

class Application < Sinatra::Base
  enable :sessions

  register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @p = User.joins(:posts).select("users.*, posts.*")
    return erb(:homepage)
  end

  get "/sign-up" do
    return erb(:signup)
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    return erb(:signinfailed) if user == nil
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
end
