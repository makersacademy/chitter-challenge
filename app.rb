require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'
require_relative 'lib/cheep'
require_relative 'lib/user'

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  def username_exists(username)
    User.find_by(username: username)
  end

  def email_exists(email)
    User.find_by(email: email)
  end

  get "/" do
    @cheeps = Cheep.order("created_at DESC")
    @corresponding_users = @cheeps.map do |cheep|
      User.find(cheep.user_id)
    end
    erb(:homepage)
  end

  get "/new_user" do
    erb(:new_user)
  end

  get "/login" do
    erb(:login)
  end

  post "/new_user" do
    if username_exists(params[:username]) || email_exists(params[:email])
      status 400
      return erb(:failure)
    end
    User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    erb(:success)
  end
end
