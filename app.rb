require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base

  enable :sessions

  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository' ### posibly not needed with sessions?
    also_reload 'lib/peep_repository' ### posibly not needed with sessions?
    set :message, "Log in to create new peeps." # Creates a var that can be used across route handlers and views
    set :logged, false
    set :validation_error, ""
  end

  get '/' do
    repo = PeepRepository.new
    peeps = repo.all_with_names
    @peep_info = peeps.map{ |peep| [peep.username, peep.time, peep.body, peep.tags, peep.name]}.reverse
    return erb(:index)
  end

  get '/peeps/new' do
    @user_id = 2 # placeholder code for sending logged in user id!!!
    return erb(:add_peep)
  end

  post '/peeps' do
    @body, @tags, @user_id = params[:body], params[:tags],params[:user_id]
    script_check([@body, @tags, @user_id], '/peeps/new')
    validate_string(@body, "peep")
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.body = @body
    new_peep.time = Time.now.strftime("%Y-%m-%d %T")
    new_peep.tags = @tags
    new_peep.user_id = @user_id 
    repo.create(new_peep)
    return redirect('/')
  end

  get '/register/new' do
    return erb(:register)
  end
  
  post '/register' do
    @name, @username, @email, @password = params[:name], params[:username], params[:email], params[:password]
    script_check([@name, @username, @email, @password], '/register/new')
    validate_string(@name, "name")
    validate_string(@username, "username")
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
    return redirect('/')
  end

  get '/login/form' do
    return erb(:login)
  end

  post '/login' do
    @email = params[:email]
    @password = params[:password]
    script_check([@email, @password], '/login/form')
    email_exists(@email)
    user = UserRepository.new.find_by_email(@email)
    email_password_match(user, @password)
    return redirect('/')
  end

  get '/logout' do
    session.clear
    settings.logged = false
    settings.message = "Log in to create new peeps."
    return redirect('/')
  end

  helpers do
    def validate_string(name, field)
      unless name.match?(/[a-zA-Z]/)
        settings.validation_error = "Invalid #{field}: must contain one or more letters."
        return redirect('register/new')
      end
    end

    def validate_email(email)
      unless email =~ URI::MailTo::EMAIL_REGEXP
        settings.validation_error = "Invalid email: please enter a valid email to register."
        return redirect('register/new')
      end
    end

    def validate_password(password)
      unless password.match(/^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$/)
        settings.validation_error = "Invalid password: minimum eight characters and contain at least one lowercase letter, uppercase letter and digit."
        return redirect('register/new')
      end
    end

    def username_email_unique(username, email)
      if UserRepository.new.all_usernames.include?(username)
        settings.validation_error = "That username is already taken."
        return redirect('register/new')
      end
      if UserRepository.new.all_emails.include?(email)
        settings.validation_error = "That email is already registered to a user."
        return redirect('register/new')
      end
    end

    def email_exists(email)
      emails = UserRepository.new.all_emails
      unless emails.include?(email)
        settings.validation_error = "Email and password do not match any registered user."
        return redirect('login/form')
      end
    end

    def email_password_match(user, password)
      unless @password == user.password # i.e. if <entered-password> == <password-stored-for-entered-email>
        session[:user_id] = nil
        settings.logged = false
        settings.validation_error = "Email and password do not match any registered user."
        return redirect('/login/form')
      end
      session[:username] = user.username
      session[:user_id] = user.id
      settings.logged = true
    end

    def script_check(inputs_array, redirect_path)
      if inputs_array.join.match?(/[<>\/]/)
        session[:user_id] = nil
        settings.logged = false
        settings.validation_error = "'<', '>' and '/' are not permitted characters."
        return redirect(redirect_path)
      end
    end

  end
end
