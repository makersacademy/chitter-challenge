require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/database_connection'
require_relative './lib/comment_repository'
require_relative './lib/peep_repository'
require_relative './lib/user_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    peep_repository = PeepRepository.new 
    @peeps = peep_repository.all
    @user_repository = UserRepository.new 
    @comment_repository = CommentRepository.new
    return erb(:homepage_not_logged_in)
  end

  get '/signup' do 
    return erb(:signup)
  end

  post '/signup' do 
    username = params[:username]
    email = params[:email]
    password = params[:password]
    new_user = User.new 
    new_user.username = username
    new_user.email = email 
    new_user.password = password
    repo = UserRepository.new 
    repo.create(new_user)
    peep_repository = PeepRepository.new 
    @peeps = peep_repository.all
    @user_repository = UserRepository.new 
    @comment_repository = CommentRepository.new
    return erb(:homepage_logged_in)
  end
end