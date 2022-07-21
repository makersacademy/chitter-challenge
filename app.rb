require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/user_repository'
require_relative './lib/peep_repository'
require_relative './lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
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
    end
    return erb(:account_creation_fail)
  end

  get "/login" do
    return erb(:login) if session[:id].nil?
    redirect "/account/#{session[:id]}"
  end

  post "/login" do
    repo = UserRepository.new
    account = repo.check_login(params[:email], params[:password])
    unless account.empty?
      session[:id] = account[0].id.to_s
      redirect "/account/#{account[0].id}"
    end
    return erb(:fail)
  end

  get "/account/:id" do
    unless session[:id].nil?
      @user = UserRepository.new.find(session[:id])[0]
      @users = UserRepository.new
      @peeps = PeepRepository.new.find_by_user(session[:id])
      return erb(:account)
    end
    redirect "/login"
  end

  post "/peep" do
    peep = Peep.new
    peep.content = params[:contents]
    peep.date = Time.new.strftime("%Y-%m-%d %H:%M:%S")
    peep.user_id = session[:id]
    PeepRepository.new.create(peep)
    redirect "/account/#{peep.user_id}"
  end

  get "/logout" do
    session[:id] = nil
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