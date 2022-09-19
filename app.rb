require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require_relative "lib/peep"
require_relative "lib/user"
require "database_cleaner"

configure :development do
  DatabaseCleaner.clean_with(:truncation)
  load "./db/seeds.rb"
end

class Application < Sinatra::Base
  register Sinatra::Reloader
  register Sinatra::ActiveRecordExtension
  enable :sessions

  get "/" do
    @peeps = Peep.all.reverse
    if session[:session_user_id]
      @user = User.find(session[:session_user_id])
    end
    erb :index
  end

  post "/new_post/:id" do
    peep = Peep.create(post: params[:post], user_id: params[:id])
    if peep.save
      redirect "/"
    else
      "failed to create a post!"
    end
  end

  get "/new_user" do
    erb :registration
  end

  post "/new_user" do
    encrypted_password = BCrypt::Password.create(params[:password])
    user = User.new("email": params[:email],
                    "password_digest": encrypted_password,
                    "first_name": params[:first_name],
                    "username": params[:username])
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
end
