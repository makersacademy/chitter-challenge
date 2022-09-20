require "sinatra/base"
require "sinatra/activerecord"
require "bcrypt"

require_relative "lib/peep"
require_relative "lib/user"


class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions

  get "/" do
    @peeps = Peep.all.order(created_at: :desc)
    if session[:session_user_id]
      @user = User.find(session[:session_user_id])
    end
    erb :index
  end

  post "/new_peep/:id" do
    peep = Peep.new("text": params["peep"]["text"], "user_id": params["id"])
    if post.save
      redirect "/"
    else
      "failed to create a peep!"
    end
  end

  get "/new_user" do
    erb :registration
  end

  post "/new_user" do
    encrypted_password = BCrypt::Password.create(params["password"])
    user = User.new("email": params["email"],
                    "password_digest": encrypted_password,
                    "name": params[:name],
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
      ""
    end
  end

end

