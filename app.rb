require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/user_repository'
require_relative 'lib/post_repository'
require_relative 'lib/user'
require_relative 'lib/post'
require 'date'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('twitter_database_test')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/post_repository'
  end

  before do
    @post_repository = PostRepository.new
    @user_repository = UserRepository.new
  end

  get '/posts' do
    @post_repository = PostRepository.new
    @user_repository = UserRepository.new
    @all_posts = @post_repository.all
    @all_usernames = []
    @all_names = []
    @all_posts.each {
      |post|
      user = @user_repository.find(post.user_id)
      @all_usernames.push(user.username)
      @all_names.push(user.name)
    }

    return erb(:posts)
  end

  post '/posts' do
    user_id = 1
    time = DateTime.now()
    new_post = Post.new()
    new_post.title = params[:title]
    new_post.contents = params[:contents]
    new_post.time = time
    new_post.user_id = user_id

    @post_repository.create(new_post)

    return redirect('/posts')
  end

  get '/posts/new' do
    return erb(:new_post)
  end

  get '/users/sign-up' do
    return erb(:sign_up)
  end

end
