require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require 'bcrypt'

DatabaseConnection.connect

class Application < Sinatra::Base

  enable :sessions # allows users sessions

  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    repo = PeepRepository.new
    peeps = repo.all_with_names
    @peep_info = peeps.map{ |peep| [peep.username, peep.time, peep.body, peep.tags, peep.name]}.reverse
    return erb(:index)
  end

  get '/peeps' do
    @user_id = session[:user_id] 
    return erb(:add_peep)
  end

  post '/peeps' do
    @body, @tags, @user_id = params[:body], params[:tags],params[:user_id]
    script_check([@body, @tags, @user_id], '/peeps')
    validate_string(@body, "peep", '/peeps')
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.body = @body
    new_peep.time = Time.now#.strftime("%Y-%m-%d %T")
    new_peep.tags = @tags
    new_peep.user_id = @user_id 
    repo.create(new_peep)
    return redirect('/')
  end

  get '/register' do
    return erb(:register)
  end
  
  post '/register' do
    @name, @username, @email, @password = params[:name], params[:username], params[:email], params[:password]
    script_check([@name, @username, @email, @password], '/register')
    validate_string(@name, "name", '/register')
    validate_string(@username, "username", '/register')
    validate_email(@email)
    username_email_unique(@username, @email)
    validate_password(@password)
    user_repo = UserRepository.new
    new_user = User.new
    new_user.name = @name
    new_user.username = @username
    new_user.email = @email
    new_user.password = @password
    user_repo.create(new_user)
    user = user_repo.find_by_email(@email)
    login_user(user)
    return redirect('/')
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    @email = params[:email]
    @password = params[:password]
    script_check([@email, @password], '/login')
    email_exists(@email)
    user = UserRepository.new.find_by_email(@email)
    email_password_match(user, @password)
    return redirect('/')
  end

  get '/logout' do
    session.clear
    return redirect('/')
  end

  helpers do
    def validate_string(name, field, redirect_path)
      unless name.match?(/[a-zA-Z]/)
        session[:error] = "Invalid #{field}: must contain one or more letters.\n"
        return redirect(redirect_path)
      end
    end

    def validate_email(email)
      unless email =~ URI::MailTo::EMAIL_REGEXP
        session[:error] = "Invalid email: please enter a valid email to register.\n"
        return redirect('register')
      end
    end

    def validate_password(password)
      unless password.match(/^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$/)
        session[:error] = "Invalid password: minimum eight characters and contain at least one lowercase letter, uppercase letter and digit.\n"
        return redirect('register')
      end
    end

    def username_email_unique(username, email)
      if UserRepository.new.all_usernames.include?(username)
        session[:error] = "That username is already taken.\n"
        return redirect('register')
      end
      if UserRepository.new.all_emails.include?(email)
        session[:error] = "That email is already registered to a user.\n"
        return redirect('register')
      end
    end

    def email_exists(email)
      emails = UserRepository.new.all_emails
      unless emails.include?(email)
        session[:error] = "Email and password do not match any registered user.\n"
        return redirect('login')
      end
    end

    def email_password_match(user, entered_password)
      stored_password = BCrypt::Password.new(user.password)
      unless stored_password == entered_password # i.e. UNLESS <stored-password-hash> == <entered-password>
        session[:user_id] = nil
        session[:error] = "Email and password do not match any registered user.\n"
        return redirect('/login')
      end
      login_user(user)
    end

    def login_user(user)
      session[:username] = user.username
      session[:user_id] = user.id
    end

    def script_check(inputs_array, redirect_path)
      if inputs_array.join.match?(/[<>\/]/)
        session[:user_id] = nil
        session[:error] = "'<', '>' and '/' are not permitted characters.\n"
        return redirect(redirect_path)
      end
    end

  end
end
