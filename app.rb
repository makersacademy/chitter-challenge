
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_params'
require_relative 'lib/user_repository'
require 'time'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    @peeps_with_users = homepage_peeps
    return erb(:peeps)
  end

  get '/register' do
    return erb(:registration)
  end

  post '/register' do
    checking_params = UserParams.new(params[:new_name], params[:new_username], params[:new_email], params[:new_password])
    
    if empty_user_params? 
      erb(:empty_user_params)
    
    elsif checking_params.duplicate_email?
      erb(:duplicate_email)
    
    elsif checking_params.duplicate_username?
      erb(:duplicate_username)
    
    elsif checking_params.invaild_user_params?
      erb(:failed_registration)
    
    else 
      @new_user = create_user
      return erb(:user_created)
    end
  end
  
  get '/login' do
    return erb(:login)
  end

  post '/login' do 
    repo = UserRepository.new
    all_users = repo.all
    
    user_account = all_users.select do |user|
      user.username == params[:login_username]
    end
   
    if user_account == []
      erb(:failed_login)
    elsif user_account.first.password != params[:login_password]
      erb(:incorrect_password)
    else
      @name = user_account.first.name
      @username = user_account.first.username
      return erb(:successful_login)
    end
  end
  
  get '/:username' do 
    @username = params[:username]
    @peeps_with_users = homepage_peeps

    return erb(:logged_in)
  end 

  get '/:username' do 
    return erb(:login)
  end 

  post '/peep/:user_name' do  
    users_repo = UserRepository.new
    all_users = users_repo.all

    user_account = all_users.select do |user|
      user.username == params[:user_name]
    end
   
    if user_account == []
      return erb(:user_not_recognised)
    end

    @user = users_repo.find_by_username(params[:user_name])
    
    peep_repo = PeepRepository.new
    new_peep = Peep.new
    
    new_peep.context = params[:peep_context]
    new_peep.time_and_date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    new_peep.user_id = @user.id

    if empty_peep_params?
      return erb(:empty_peep_params)
    else
      escape_html
      peep_repo.create(new_peep)
      return erb(:peep_created)
    end
  end
 
  private 

  def empty_user_params?
    params[:new_name] == "" || params[:new_name] == nil || params[:new_username] == "" || params[:new_username] == nil || params[:new_email] == "" || params[:new_email] == nil || params[:new_password] == "" || params[:new_password] == nil 
  end

  def empty_peep_params?
    params[:peep_context] == "" || params[:peep_context] == nil 
  end

  def escape_html
    params[:peep_context].gsub!('<', '&lt;')
    params[:peep_context].gsub!('>', '&gt;')
  end

  def homepage_peeps
    peeps_repo = PeepRepository.new
    all_peeps = peeps_repo.all.reverse #need to order
    users_repo = UserRepository.new
    @username = params[:username]
    @peeps_with_users = {}
  
    all_peeps.each do |peep|
      peep_details = {}
      user = users_repo.find(peep.user_id)
      peep_details[:name] = user.name
      peep_details[:username] = user.username
      peep_details[:context] = peep.context
      peep_details[:time_and_date] = peep.time_and_date
  
      @peeps_with_users[peep.id.to_i] = peep_details
    end
    return @peeps_with_users
  end 

  def create_user
    repo = UserRepository.new
    @new_user = User.new
    @new_user.name = params[:new_name]
    @new_user.username = params[:new_username]
    @new_user.email = params[:new_email]
    @new_user.password = params[:new_password]

    repo.create(@new_user)
    return @new_user
  end
end