require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/comment_repository'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @peeps = @peep_repo.all

    return erb(:index)
  end

  get '/login' do
    return erb(:login)
  end

  get '/signup' do
    return erb(:signup)
  end

  get '/:user_id' do
    @user_id = params[:user_id]
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @comment_repo = CommentRepository.new

    @peeps_by_user = @peep_repo.peeps_by_user(@user_id)
    
    return erb(:user_id)
  end

  get '/peep/:peep_id' do
    @peep_id = params[:peep_id]
    @user_repo = UserRepository.new
    @peep_repo = PeepRepository.new
    @comment_repo = CommentRepository.new

    @peep_by_id = @peep_repo.find_peep_by_id(@peep_id)
    @comments_by_peep = @comment_repo.comments_by_peep(@peep_id)
    
    return erb(:peep_with_comments)
  end

  # def check_login
  #   @logged_in = false

  # end
end