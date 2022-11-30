require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/peep'
require_relative 'lib/comment'
require_relative 'lib/user'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/comment_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/comment_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    @peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    return erb(:index)
  end

  post '/credentials_checker' do
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    if password_matches_user
      return erb(:logged_in)
    else
      return erb(:bad_credentials)
    end
  end

  get '/sign_up' do
    return erb(:registration_form)
  end

  get '/index/:username' do
    return erb(:logged_in)
  end

  post '/sign_up' do
    user = User.new
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    user.name = params[:name]
    user.email_address = params[:email_address]
    user.username = params[:username]
    user.password = params[:password]
    if already_signed_up
      return erb(:bad_sign_up)
    else
      @user_repo.create(user)
      return erb(:logged_in)
    end
  end

  def already_signed_up
    @user_repo = UserRepository.new
    all_users = @user_repo.all
    credentials_match = all_users.any? { |user| (params[:username] == user.username) or (params[:email_address] == user.email_address) }
    credentials_match
  end

  def password_matches_user
    @user_repo = UserRepository.new
    all_users = @user_repo.all
    password_match = all_users.any? { |user| (params[:username] == user.username) and (params[:password] == user.password) }
    password_match
  end
end  
