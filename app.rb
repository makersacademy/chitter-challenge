require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user_repository'
require_relative './lib/peep_repository'
require_relative './lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @peeps = PeepRepository.new.all
    @users = UserRepository.new
    return erb(:index)
  end

  get "/signup" do
    return erb(:signup)
  end

  post "/signup" do
    unless check_credentials_for_dbls(params[:username], params[:email])
      create_account(params[:username], params[:email], params[:password])
      return erb(:account_creation)
    else
      return erb(:account_creation_fail)
    end
  end

  get "/login" do
    return erb(:login)
  end

  post "/login" do
    repo = UserRepository.new
    account = repo.check_login(params[:email], params[:password])
    unless account.empty?
      ENV["USER_ID"] = account[0].id.to_s
      redirect "/account/#{account[0].id}"
    else
      return erb(:fail)
    end
  end

  get "/account/:id" do
    unless ENV["USER_ID"] == "0"
      @user = UserRepository.new.find(ENV["USER_ID"])[0]
      @users = UserRepository.new
      @peeps = PeepRepository.new.find_by_user(ENV["USER_ID"])
      return erb(:account)
    else
      redirect "/"
    end
  end

  post "/peep" do
    peep = Peep.new
    peep.content = params[:contents]
    peep.date = Time.new.strftime("%Y-%m-%d %H:%M:%S")
    peep.user_id = ENV["USER_ID"]
    PeepRepository.new.create(peep)
    redirect "/account/#{peep.user_id}"
  end

  get "/logout" do
    ENV["USER_ID"] = "0"
    return erb(:logout)
  end
  
  

  private

  def create_account(username, email, password)
    user = User.new
    repo = UserRepository.new
    user.username = username
    user.email = email
    user.password = password
    repo.create(user)
  end

  def check_credentials_for_dbls(username, email)
    repo = UserRepository.new
    return repo.find_dbl(username, email)
  end

end