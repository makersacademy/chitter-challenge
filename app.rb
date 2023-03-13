require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/post_repository'
require 'sinatra/base'
require 'sinatra/reloader'


DatabaseConnection.connect('chitter')


class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
    
  end

  enable :sessions 

  get '/' do
    post_repo = PostRepository.new
    user_repo = UserRepository.new

    @post = post_repo.all

    # @post_2 = post_repo.find(params[:id])
    # @user = user_repo.find(@post_2.artist_id)

    return erb(:index)
  end

  error Sinatra::NotFound do
    content_type 'text/plain'
    [404, 'There is nothing out here, go back!']
  end

  post '/signup' do
    repo = UserRepository.new 
    new_user = User.new
    new_user.username = params[:username]
    new_user.password = params[:password] 

    repo.create(new_user)

    redirect to('/signedup')
  end

  get '/signedup' do
    return erb(:signedup)
  end

  # post '/login' do
  #   repo = UserRepository.new 
  #   new_user = User.new
  #   new_user.username = params[:username]
  #   new_user.password = params[:password] 

  #   repo.create(new_user)

  #   return ''
  # end

  post '/peep' do

    repo = PostRepository.new
    new_post = Post.new

    new_post.message = params[:message]
    new_post.user_id = params[:user_id]

    repo.create(new_post)

    redirect to('/')
  end
end