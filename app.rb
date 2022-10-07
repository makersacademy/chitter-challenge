require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    return erb(:home)
  end

  get '/peeps' do
    peep_repo = PeepRepository.new
    user_repo = UserRepository.new
    @peeps = peep_repo.all(" ORDER BY time DESC")
    @user = user_repo.find_by_username(params[:username])
    return erb(:all_peeps)
  end

  post '/peeps' do
    invalid_peep_params?
    peep_repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.time = (Time.now).strftime("%F %T")
    new_peep.user_id = params[:user_id]
    # @users = user_repo.find_by_username(params[:username])
    
    peep_repo.create(new_peep)
    return ''
  end

  get '/peeps/new' do
    user_repo = UserRepository.new
    @users = user_repo.all
    return erb(:new_peep)
  end

  post '/users' do
    invalid_user_params?
    user_repo = UserRepository.new
    new_user = User.new
    new_user.first_name = params[:first_name]
    new_user.last_name = params[:last_name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]

    user_repo.create(new_user)
  end

  get '/users' do
    user_repo = UserRepository.new
    @users = user_repo.all
    return erb(:all_users)
  end

  get '/users/new' do
    return erb(:new_user)
  end

  get '/users/login' do
    return erb(:login)
  end

  private

  def invalid_peep_params?
    if params[:content] == nil || params[:time] == nil || params[:user_id] == nil 
      status 400
      return ''
    end
  end

  def invalid_user_params?
    if params[:first_name] == nil || params[:last_name] == nil ||
       params[:username] == nil || params[:email] == nil || params[:password] == nil 
      status 400
      return ''
    end
  end
end