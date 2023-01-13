require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repository'
    also_reload 'lib/user_repository'
  end

  get '/posts' do
    repo = PostRepository.new
    @posts = repo.all

    return erb(:posts)
  end

  get '/users' do
    repo = UserRepository.new
    @users = repo.all

    return erb(:users)
  end
end