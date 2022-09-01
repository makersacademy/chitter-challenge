require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/post_repository'
require_relative './lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base

  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get "/" do
    return erb(:welcome)
  end

  get "/signup" do
    return erb(:signup)
  end

  post "/signup" do
    if empty_request_parameters? || invalid_request_parameters?
      status 400
      return ''
    end

    user = User.new
    user.username = params[:username]
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]

    user_repo = UserRepository.new
    user_repo.create(user)    

    return erb(:signupsuccess)
  end

  get "/signupsuccess" do
    return erb(:signupsuccess)
  end

  post "/login" do

    #find user in database based on their username, check to see if their password = username
    
    params[:username]
    params[:password]
    return erb(:stream)
  end

  private

  def empty_request_parameters?
    params[:username].nil? || params[:name].nil? || params[:email].nil? || params[:password].nil?
  end

  def invalid_request_parameters?
    params[:username].length > 20 || params[:name].length > 20 || params[:email].length > 20 || params[:password].length > 20

    !(params[:password] =~ /[\W][^_!£$%]/).nil?
  end
end
