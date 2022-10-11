require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
# require_relative 'lib/input_validation'
require 'sinatra/base'
require 'sinatra/reloader'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

  get "/" do
    peeps_list
    @user_repo = UserRepository.new
    return erb(:index)
  end

  get "/signup" do
    return erb(:signup)
  end

  post "/new_user" do
    signup_input_validation
    if @error != nil
      @name = params[:name]
      return erb(:signup)
    end
    repo_users = UserRepository.new
    @user = User.new
    @user.name = params[:name]
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]
    repo_users.create(@user)
    erb(:new_user_confirmation)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    @user_repo = UserRepository.new
    @user = @user_repo.find_by_email(params[:email])
    if (@user.nil? || @user.password != params[:password])
      @error = "The information you provided does not match our records."
      return erb(:login)
    end
    session[:user_id] = @user.id
    peeps_list
    return erb(:user_chitter)
  end

  get '/logout' do
    session[:user_id] = nil
    @logged_out = true
    peeps_list
    @user_repo = UserRepository.new
    return erb(:index)
  end

  post '/new_peep' do
    if session[:user_id].nil?
      return redirect('/login')
    end
    @user_repo = UserRepository.new
    @user = @user_repo.find(session[:user_id])
    peeps_list
    if params[:content].empty?
      @error = true
      return erb(:user_chitter)
    end
    peep = Peep.new
    peep.content = params[:content]
    peep.time = Time.new
    peep.user_id = session[:user_id]
    @peep_repo.create(peep)
    peeps_list
    return erb(:user_chitter)
  end

  private

  def signup_input_validation
    @name = params[:name]
    @username = params[:username]
    @email = params[:email]
    @password = params[:password]
    return @error unless input_field_empty_error.nil?
    return @error unless incorrect_format_errors.nil?
    return @error unless user_exist_error.nil?
  end

  def input_field_empty_error
    unless (@name.length.zero? || @username.length.zero? || @password.length.zero?)
      return
    end
    @error = "Some essential information is missing."
  end
  
  def incorrect_format_errors
    if @name.match?(/[^a-z\s-]{2,30}/i)
      @error = "Your name seems to be incorrect."
    elsif (@username.match?(/[^a-z\d]/i) || @username.length < 5)
      @error = "Your username must contain letters and numbers and be 5 to 16 characters long"
    elsif (!@email.include?('@') || @email.split("@")[-1] != 'makersacademy.com' ||
        @email.split("@")[0].match?(/[^a-z\s-]{2,16}/i))
      @error = "Please use your Makers' email to create a Chitter account."
    end
  end

  def user_exist_error
    repo_users = UserRepository.new
    if repo_users.email_exists?(@email)
      @error = "This email has already been registered."
    elsif repo_users.username_exists?(@username)
      @error = "This username is already in use. Please choose a different one."
    end
  end

  def peeps_list
    @peep_repo = PeepRepository.new
    @peeps = @peep_repo.all.sort_by { |post| post.time }.reverse
  end
end
