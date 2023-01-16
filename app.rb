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

  get '/' do
    post_repo = PostRepository.new
    @all_posts = post_repo.all
    
    return erb(:homepage)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    if invalid_signup_parameters?
      status 400
      return ''
    end 
    user_repo = UserRepository.new
    new_user = User.new
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email_address = params[:email_address]
    new_user.password = params[:password]
 
    user_repo.create(new_user)
  end

  get '/new_post' do
    return erb(:new_post)
  end

  post '/new_post' do
    if invalid_post_parameters?
      status 400
      return ''
    end

    post_repo = PostRepository.new
    new_post = Post.new
    new_post.message = params[:message]
    new_post.time_created = DateTime.now

    post_repo.create(new_post)
  end

  private

  def invalid_post_parameters?
    return params[:message] == ''
  end

  def invalid_signup_parameters?
    return params[:name] == '' || params[:username] == '' || params[:email_address] == '' || params[:password] == '' 
  end
end
