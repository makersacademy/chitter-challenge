require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repo'
require_relative 'lib/user_repo'
DatabaseConnection.connect

class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repo'
    also_reload 'lib/user_repo'
  end

  
  get "/" do
    peep_repo = PeepRepo.new
    @posts = peep_repo.peep_feed.sort { |post| DateTime.parse(post.time) }
    return erb(:home)
  end

  get "/login" do
    return erb(:login)
  end

  post "/login" do
    if invalid_login?
      status 400
      return "Username or password cannot be empty"
    end

    if incorrect_login?
      status 400
      return "Incorrect username or password"
    end
    repo = UserRepo.new
      @username = params[:username]
      @user_id = repo.find(params[:username]) 
      @loggedin = true
    return erb(:loggedin)
  end

  get "/signup" do

    return erb(:signup)
  end

  post "/signup" do
    if invalid_signup?
      status 400
      return "Username or password cannot be empty"
    end

    if existing_username?
      status 400 
      return "Existing username, please choose another"
    end

    repo = UserRepo.new
    new_user = User.new
    new_user.username = params[:username]
    new_user.password = params[:password]
    repo.create_user(new_user)
    @user = new_user
    @id = repo.find(params[:username])
    return erb(:successful_signup)
  end

  get "/peep" do
    return erb(:peep)
  end

  post "/peep" do
    if invalid_peep?
      status 400
      return "Contents or author id must not be empty"
    end

    if author_id?
      status 400  
      return 'Author id not found'
    end

    repo = PeepRepo.new
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.author_id = params[:author_id]
    new_peep.time_posted = params[:time_posted]
    repo.create_peep(new_peep)
    return erb(:successful_peep)
  end

  get "/peepmade" do
    return erb(:successful_peep)
  end

  def invalid_signup?
    return (params[:username].empty? || params[:password].empty?)
  end
  
  def existing_username?
    repo = UserRepo.new
    return repo.match_username?(params[:username])
  end

  def invalid_peep?
    return (params[:content].empty? || params[:author_id].empty?)
  end

  def invalid_login?
    repo = UserRepo.new
    return (params[:username].empty? || params[:password].empty?)
  end

  def incorrect_login?
    repo = UserRepo.new
    return repo.invalid_login?(params[:username], params[:password])
  end

  def author_id?
    repo = UserRepo.new
    users = repo.all
    if params[:author_id].to_i <= 0 || params[:author_id].to_i > (users.length.to_i)
      return true
    end
  end
end