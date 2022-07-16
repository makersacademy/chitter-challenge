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
    
    return erb(:home)
  end

  get "/signup" do

    return erb(:signup)
  end

  post "/signup" do
    if invalid_signup?
      status 400
      return " "
    end

    repo = UserRepo.new
    new_user = User.new
    new_user.username = params[:username]
    new_user.password = params[:password]
    repo.create_user(new_user)
    @user = new_user
    return erb(:succesful_signup)
  end

  get "/peep" do
    return erb(:peep)
  end

  post "/peep" do
    if invalid_peep?
      status 400
      return " "
    end

    repo = PeepRepo.new
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.author_id = params[:author_id]
    new_peep.time_posted = params[:time_posted]
    repo.create_peep(new_peep)
    return erb(:home)
  end

  def invalid_signup?
    return (params[:username].nil? || params[:password].nil?)
  end

  def invalid_peep?
    return params[:content] == nil? || params[:author_id] == nil?
  end
end
