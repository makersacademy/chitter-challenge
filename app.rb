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
    also_reload 'lib/user_repository'
    also_reload 'lib/post_repository'
  end

  get '/user' do
    @user_repo = UserRepository.new
    @post_repo = PostRepository.new
    return erb(:user)
  end

  get '/peeps' do 
    return erb(:peeps)
  end

  get '/peeps/:id' do 
    repo = PostRepository.new
    @post = repo.find(params[:id]) 
    return erb(:peep)
  end 


  get '/' do 
    post_repo = PostRepository.new
    user_repo = UserRepository.new
    @posts = post_repo.all
    return erb(:home)
  end 

  get '/join' do
    return erb(:join)
  end

  get '/login' do
    return erb(:login)
  end
  
  post '/peeps' do 
    user_post = UserRepository.new
    post_repo = PostRepository.new
    new_post = Post.new
    new_post.content = params[:content]
    new_post.post_timestamp = params[:post_timestamp]
    new_post.user_id = params[:user_id]

    repo.create(new_post)

    return erb(:peeps)
  end 




end