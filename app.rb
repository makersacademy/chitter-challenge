require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/database_connection'
require 'json'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
    set :port, 5432
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/peeps/login' do
    return erb(:login)
  end

  post '/peeps' do
    content = params[:content]
    peep_date = Time.now.getutc
    user_id = session[:email]
    tags = params[:tags]

    if user_id.nil?  
      return erb(:login)
    end

    if content.empty?
      return erb(:new_peep)
    end
    
    new_peep = Peep.new
    peeps = PeepRepository.new
    all_peeps = peeps.all
    new_peep.id = all_peeps.last.id + 1
    new_peep.tags = tags
    new_peep.content = content
    new_peep.peep_date = peep_date
    new_peep.user_id = user_id
    PeepRepository.new.create(new_peep)
    return erb(:peep_posted)
  end

  get '/' do
    return erb(:chitter)
  end

  get 'peep/log' do
    return erb(:log_out)
  end

  get '/peeps/new' do
    repo = PeepRepository.new
    user_repo = UserRepository.new
    @users = user_repo.all
    @username = @users.select { |user| user.username }
    @peeps = repo.all
    return erb(:new_peep)
  end

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all
    @sorted_peeps = @peeps.sort_by { |peep| peep.peep_date }.reverse!
    return erb(:peeps)
  end

  get '/signup' do
    return erb(:sign_up)
  end

  get "/peeps/:id" do
    repo = PeepRepository.new
    repo2 = UserRepository.new
    @peep = repo.find(params[:id])
    @user = repo2.find(@peep.user_id)
    return erb(:peep)
  end

  post '/login' do
    email = params[:email]
    password = params[:password]
    users_repo = UserRepository.new
    users = users_repo.all

    if email.empty? || password.empty? 
      return erb(:incorrect_login)
    end

    user = UserRepository.new.find_by_email(email)
    
    if user.password == password
      session[:email] = user.id 
      return erb(:login_succesful)
    else 
      return erb(:incorrect_login)
    end
  end

  post '/signup' do

    email = params[:email]
    password = params[:password]
    name = params[:name]
    username = params[:username]

    if email.empty? || password.empty? || name.empty? || username.empty?
      return erb(:sign_up)
    end

    new_user = User.new
    users_repo = UserRepository.new
    users = users_repo.all
    new_user.email = email
    new_user.password = password
    new_user.name = name
    new_user.username = username
    users.each do |user|
      if username == user.username 
        return erb(:username_password_taken)
      elsif email == user.email
        return erb(:username_password_taken)
      end
    end
    users_repo.create(new_user)
    return erb(:sign_up_successful)
  end
    
  get '/logout' do
    session[:email] = nil
    return erb(:logout)
  end
end
