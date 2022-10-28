require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('my_chitter_database')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/post_repository'
    also_reload 'lib/user_repository'
  end

  p ENV['DATABASE_URL'].to_s

  get '/' do
    post_repo = PostRepository.new
    user_repo = UserRepository.new
    @posts = post_repo.all.sort_by { |post| post.date }.reverse!
    @users = user_repo.all
    return erb(:posts)
  end
  
  get '/sign_up' do
    return erb(:sign_up)
  end

  post '/sign_up' do
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]

    repo = UserRepository.new
    new_user = User.new
    new_user.name = name
    new_user.username = username
    new_user.email = email
    new_user.password = password

    repo.create(new_user)

    return 'Your data has been saved!'
  end

  get '/create_post' do
    return erb(:create_post)
  end

  post '/create_post' do
    user_id = params[:user_id]
    content = params[:content]

    repo = PostRepository.new
    new_post = Post.new
    new_post.user_id = user_id
    new_post.content = content
    new_post.date = Time.now

    repo.create(new_post)

    return 'Your post has been sent!'
  end

end