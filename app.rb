require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    if session[:user_id] != nil
      return redirect('/userpage')
    end
    peep_repo = PeepRepository.new
    @users = UserRepository.new
    @peeps = peep_repo.all.sort_by!{ |peep| peep.time }.reverse!
    return erb(:index)
  end

  post '/logged_in' do

    #if invalid_user_params? then
    #  status 400
    #  return 'Invalid user details.'
    #end

    user_repo = UserRepository.new

    if !user_repo.all.any?{|user| user.username == params[:username]} then
      status 400
      return "Username does not exist, please try again."
    end

    username = params[:username]
    password = params[:password]

    user = user_repo.find(username)
   
    if user.password == password
      # Set the user ID in session
      session[:user_id] = user.id

      redirect "/logged_in"

      
    else
      status 400
      return 'Invalid user details.'
    end
  end

  get '/logged_in' do
    if session[:user_id] == nil
      # No user id in the session
      return redirect('/')
    else

      user_id = session[:user_id]

      @user_repo = UserRepository.new
      peep_repo = PeepRepository.new

      @user = @user_repo.find(user_id)
      @peeps = peep_repo.find_by_owner(@user.id).sort_by!{|peep| peep.time}.reverse!

      return erb(:logged_in)
    end

  end

  get '/peeps' do
    peep_repo = PeepRepository.new
    @users = UserRepository.new
    @peeps = peep_repo.all.sort_by!{ |peep| peep.time }.reverse!
    return erb(:peeps)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do

    users = UserRepository.new
    
    if users.all.any?{|user| user.email == params[:email]} then
      status 400
      return "Email address already signed up."
    end

    if users.all.any?{|user| user.username == params[:username]} then
      status 400
      return "Username already taken, please choose another."
    end

    if invalid_signup_params? || invalid_user_params? then
      status 400
      return 'Invalid credentials, please try again.'
    end

    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.username = params[:username]
    user.password = params[:password]

    users.create(user)

    user = users.find_by_username(user.username)
    session[:user_id] = user.id

    redirect "/logged_in"

  end

  private
  def invalid_user_params?
    params[:username] == nil || 
    params[:password] == nil || params[:password] == "" 
  end

  def invalid_peep_params?
    params[:content] == nil ||  params[:content]== "" 
  end

end
