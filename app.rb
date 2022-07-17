require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require 'sinatra/base'
require 'sinatra/reloader'

# DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @peeps = peep_repo.all.sort do |post|
      DateTime.parse(post.time)
    end
    return erb(:index)
  end

  get "/signup" do
    return erb(:signup)
  end

  post "/new_user" do
    @name = params[:name]
    params[:name].empty?
    params[:name] == nil
    params[:name].length != 0
    @username = params[:username]
    email = params[:email]
    password = params[:password]
    @error = nil
    input_validation
    if @error.nil? == false
      return erb(:new_user_error)
    end
    repo_users = UserRepository.new
    users = repo_users.all
    if repo_users.email_exists?(email)
      @error = "email_exists"
      erb(:new_user_error)
    elsif repo_users.username_exists?(@username)
      @error = "username_taken"
      erb(:new_user_error)
    else
      @user = User.new
      @user.name = @name
      @user.username = @username
      @user.email = email
      @user.password = password
      repo_users.create(@user)
      erb(:new_user_confirmation)
    end
  end

  def input_validation
    if params[:name].match?(/[^a-z\s-]{2,30}/i)
      @error = "invalid_name"
    elsif params[:username].match?(/[^a-z\d]{5,16}/i)
      @error = "invalid_username"
    elsif (!params[:email].include?('@') || params[:email].split("@")[-1] != 'makersacademy.com' || params[:email].split("@")[0].match?(/[^a-z\s-]{2,16}/i))
      @error = "not_makers_email"
    elsif ((params[:name].length == 0) || (params[:username].length == 0) || (params[:password].length == 0))
      @error = "input_missing"
    end  
    @error
  end
end
