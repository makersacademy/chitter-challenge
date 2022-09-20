require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/database_connection'
require 'json'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
    enable :sessions
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/peeps' do
    peeps_repo = PeepRepository.new
    @peeps = peeps_repo.all
    @sorted_peeps = @peeps.sort_by { |peep| peep.peep_time }.reverse!
    users_repo = UserRepository.new
    @users = users_repo.all
    return erb(:peeps)
  end

  get '/peeps/new' do
    return erb(:new_peep)
  end

  post '/peeps' do
    content = params[:content]
    peep_time = Time.now.getutc
    user_id = session[:user_id]

    if content.length.zero?
      status 400
      return 'ERROR: Contents field must be filled'
    end

    if user_id.nil?
      status 400
      return 'ERROR: Please log in to post a peep'
    end

    new_peep = Peep.new
    new_peep.content = content
    new_peep.peep_time = peep_time
    new_peep.user_id = user_id
    PeepRepository.new.create(new_peep)

    return erb(:peep_posted)
  end

  get '/signup' do
    return erb(:sign_up)
  end

  get '/login' do
    return erb(:login)
  end

  post '/signup' do
    @new_user_email = params[:email]
    password = params[:password]
    name = params[:name]
    @new_user_username = params[:username]

    if @new_user_email.length.zero? || password.length.zero? || name.length.zero? || @new_user_username.length.zero?
      status 400
      return 'ERROR: One or more fields is empty'
    end

    new_user = User.new
    new_user.email = @new_user_email
    new_user.password = password
    new_user.name = name
    new_user.username = @new_user_username

    users_repo = UserRepository.new
    users = users_repo.all

    users.each do |user|
      if @new_user_username == user.username 
        status 400
        return 'ERROR: Username is already taken'
      elsif @new_user_email == user.email
        status 400
        return 'ERROR: Email is already in use'
      end
    end
    
    UserRepository.new.create(new_user)
    session[:user_id] = new_user.id
    return erb(:sign_up_complete)
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    users_repo = UserRepository.new
    users = users_repo.all

    return 'ERROR: Email Address not found' if users.any? { |user| user.email == email } == false

    user = UserRepository.new.find_by_email(email)

    if user.password == password
      session[:user_id] = user.id
      return erb(:login_complete)
    else
      status 400
      return 'ERROR: Incorrect password'
    end
  end

  get '/logout' do
    session[:user_id] = nil
    return erb(:logout)
  end
end
