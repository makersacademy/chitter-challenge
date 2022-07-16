require 'sinatra/base'
require 'sinatra/reloader'
require '/Users/paris/Desktop/Projects/chitter-challenge/lib/user_repository'
require '/Users/paris/Desktop/Projects/chitter-challenge/lib/peep_repository'
require '/Users/paris/Desktop/Projects/chitter-challenge/lib/database_connection'

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