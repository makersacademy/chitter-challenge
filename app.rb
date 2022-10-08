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
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/peeps/login' do
    return erb(:login)
  end

  get '/' do
    return erb(:chitter)
  end

  get 'peep/log_out.php' do
    return erb(:log_out)
  end

  get '/peeps/new' do
    repo = PeepRepository.new
    user_repo = UserRepository.new
    @users = user_repo.all
    @username = @users.select do |user| user.username end
    @peeps = repo.all
    return erb(:new_peep)
  end

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all
    @sorted_peeps = @peeps.sort_by { |peep| peep.peep_date }.reverse!
    return erb(:peeps)
  end

  get '/peeps/signup' do
    return erb(:sign_up)
  end

  get '/signup' do
    return erb(:sign_up)
  end

  get '/logout' do
    return erb(:logout)
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

    return erb(:incorrect_login) if !users.any? { |user| user.email == email }

    user = UserRepository.new.find_by_email(email)

    if email.empty? || password.empty? 
      return erb(:incorrect_login)
    if user.password == password
      session[:user_id] = user.id
      return erb(:login_succesful)
    else
      return erb(:incorrect_login)
    end
  end
  end

  post '/signup' do
    email = params[:email]
    username = params[:username]
    password = params[:password]
    name = params[:name]
    user = User.new
    user_repo = UserRepository.new
    user.name = name
    user.email = email
    user.username = username
    user.password = password
    user_repo.create(user)
    return erb(:sign_up_succesful)
  end

  post '/signup' do
    email = params[:email]
    username = params[:username]
    password = params[:password]
    name = params[:name]
    user = User.new
    user_repo = UserRepository.new
    user.name = name
    user.email = email
    user.username = username
    user.password = password
    user_repo.create(user)
    return erb(:sign_up_succesful)
  end

  post '/peeps' do
    content = params[:content]
    peep_date = Time.now.getutc
    user_id = session[:user_id]
    tags = params[:tags]
    if content.length.zero?
      status 400
      return 'ERROR: Contents field must be filled'
    end

    if user_id.nil?
      status 400
      return 'ERROR: Please log in to post a peep'
    end

    new_peep = Peep.new
    peeps = PeepRepository.new
    all_peeps = peeps.all
    new_peep.id = all_peeps.last.id+1
    new_peep.tags = tags
    new_peep.content = content
    new_peep.peep_date = peep_date
    new_peep.user_id = user_id
    PeepRepository.new.create(new_peep)

    return erb(:peep_posted)
  end
end