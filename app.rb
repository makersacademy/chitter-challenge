require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_db_test')


class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    post_repo = PostRepository.new
    @posts = post_repo.all.sort_by{|post| post.date_time}.reverse
    return erb(:homepage)
  end

  get '/sign_up' do
    return erb(:sign_up)
  end

  post '/sign_up' do
    user_repo = UserRepository.new
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.user_name = params[:user_name]
    user.password = params[:password]
    user_repo.sign_up(user.name, user.email, user.user_name, user.password)
    return erb(:sign_up_confirmation)
  end
end