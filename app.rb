require 'sinatra/base'
require 'sinatra/reloader'
require 'bcrypt'
require 'rack/test'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    return erb(:index) 
  end

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all.reverse
    return erb(:peeps)
  end

  get '/peeps/:id' do 
    repo = PeepRepository.new 
    user_repo = UserRepository.new

    @peep = repo.find(params[:id])
    @user = user_repo.find(@peep.user_id)
    return erb(:peep)
  end

  get '/sign_up' do
    return erb(:new_user)
  end

  post '/sign_up' do
    name = params[:name]
    @username = params[:username]
    email = params[:email]
    password = params[:password]
    
    new_user = User.new
    new_user.name = name
    new_user.username = @username
    new_user.email = email 
    new_user.password = password
    UserRepository.new.create(new_user)
    return erb(:user_created)
  end

  get '/log_in' do
    return erb(:login)
  end

  post '/log_in' do
    email = params[:email]
    password = params[:password]
    
    user = UserRepository.new.find_by_email(email)
    return "login_error" unless user && user.password == password
    
    session[:user_id] = user.id
    erb(:login_success)
  end
  
  get '/log_out' do 
    session.clear
    erb(:login)
  end 

  get '/new_peep' do
    return erb(:new_peep)
  end

  post '/new_peep' do
    @content = params[:content]
    time = Time.now
    user_id = session[:user_id]
    new_peep = Peep.new
    new_peep.content = @content
    new_peep.time = time
    new_peep.user_id = user_id 
    PeepRepository.new.create(new_peep)
    return erb(:peep_created)
  end

end
