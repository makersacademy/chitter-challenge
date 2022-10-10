require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  enable :sessions

  # Homepage with a list of all peeps
  get '/' do
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all
    # If user is not logged in, return a page with login and sign up button (index.erb checks if @username is nil)
    if session[:user].nil?
      @username = nil
    # Otherwise, save user in session variable and display username and log out button
    else
      @username = session[:user].username
    end

    if params[:user_created] == 'true'
      @user_created = 'true'
    end
    return erb(:index)
  end

  # Login Form
  get '/login' do
    if params[:error] == 'true'
      @error_message = "Email/Password incorrect"
    end
    return erb(:login)
  end

  post '/login' do
    # check for email and password
    user = check_login_credentials(params[:email], params[:password])
    # Re-loading login page if email or password are incorrect
    if user.nil?
      redirect '/login?error=true'
    else
      # Saving user in session cookie so they can stay logged in
      session[:user] = user
      redirect '/'
    end
  end

  post '/logout' do
    session[:user] = nil
    redirect '/'
  end

  post '/new_peep' do
    peep = Peep.new
    peep.content = params[:content]
    peep.time_posted = Time.now.strftime("%Y-%m-%d %H:%M:%S") 
    peep.user_id = session[:user].id
    repo = PeepRepository.new
    repo.create(peep)
    redirect '/'
  end

  get '/sign_up' do
    case params[:error] 
    when 'invalid_email_characters'
      @error_message = "Email can only contain letters, numbers and these characters -_.@"
    when 'email_already_registered'
      @error_message = "Email is already registered!"
    when 'invalid_username_characters'
      @error_message = "Username can only contain letters and numbers."
    when 'username_exists'
      @error_message = "Username is already taken."
    when 'passwords_not_matching'
      @error_message = "The passwords don't match."
    end
    return erb(:sign_up)
  end

  post '/sign_up' do
    repo = UserRepository.new
    check_sign_up_credentials(repo, params[:email], params[:username], params[:password1], params[:password2])
    # add user to database
    user = User.new
    user.username = params[:username]
    user.email = params[:email]
    user.password = params[:password1]
    repo.create(user)
    # log in the new user
    session[:user] = user
    # redirect to home page with success message
    redirect '/?user_created=true'
  end

  # the method returns nil when email or password are incorrect
  def check_login_credentials(email, submitted_password)
    # check email exists
    repo = UserRepository.new
    user = repo.find(email)
    if user.nil?
      return nil
    end
    # check password matches
    if BCrypt::Password.new(user.password) == submitted_password
      return user
    else
      return nil
    end
  end

  def check_sign_up_credentials(repo, email, username, password1, password2)
    # check email is not already present in database
    if !repo.find(email).nil?
      redirect '/sign_up?error=email_already_registered'
    end
    
    # check email only contains numbers, letters, and -_.@
    email.chars.each do |char|
      if ! char.match(/\w/) && ! "-_.@".include?(char)
        redirect '/sign_up?error=invalid_email_characters'
      end
    end

    # check username is not already present in database
    if repo.username_exist?(username)
      redirect '/sign_up?error=username_exists'
    end

    # check username only contains numbers and letters
    if username =~ (/\W/)
      redirect '/sign_up?error=invalid_username_characters'
    end

    # check password 1 and 2 match
    if password1 != password2
      redirect '/sign_up?error=passwords_not_matching'
    end
  end

end