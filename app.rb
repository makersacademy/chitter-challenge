require 'sinatra/base'
require 'sinatra/reloader'
require 'date'
require 'bcrypt'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    @peeps_list = PeepRepository.new.all
    @users = UserRepository.new
    @user = UserRepository.new.find(session[:user_id]) unless session[:user_id].nil?

    return erb(:index)
  end

  get '/peeps/new' do
    return redirect('/') if session[:user_id].nil?

    @user = UserRepository.new.find(session[:user_id])
    return erb(:new_peep)
  end

  get '/peeps/:id' do
    peeps = PeepRepository.new
    users = UserRepository.new

    peep = peeps.find(params[:id])
    @content = peep.content
    @time = peep.time
    @name = users.find(peep.user_id).name
    @username = users.find(peep.user_id).username

    return erb(:peep)
  end

  post '/peeps' do
    @user = UserRepository.new.find(session[:user_id])
      
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.time = Time.now
    new_peep.user_id = @user.id

    PeepRepository.new.create(new_peep)

    return erb(:peep_posted)
  end

  get '/signup' do 
    return erb(:signup)
  end

  post '/signup' do

    new_user = User.new
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]

    users = UserRepository.new

    if duplicate_email_or_username?
      status 400
      return 'Error: email or username already exists. Please go back and try again'
    else
      users.create(new_user)
      return erb(:account_created)
    end
  end

  def duplicate_email_or_username?

    repo = UserRepository.new
    repo.all.each do |user|
      return true if user.username == params[:username] || user.email == params[:email]
    end
    
    return false
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    repo = UserRepository.new
    email = params[:submitted_email]
    password = params[:submitted_password]

    if repo.sign_in(email, password) == true
      @user = repo.find_by_email(email)
      session[:user_id] = @user.id
      return erb(:login_success)
    else
      status 400
      return 'Email and password do not match. Please go back and try again'
    end
  end

  get '/account_page' do
    if session[:user_id] == nil
      return redirect('/login')
    else
      @user = UserRepository.new.find(session[:user_id])
      return erb(:account_page)
    end
  end

  get '/logout' do
    session[:user_id] = nil
    return redirect('/')
  end

end
