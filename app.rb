require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
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
    input_validation
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
    if (@user == nil || @user.password != params[:password])
      @error = "The information you provided does not match our records."
      return erb(:login)
    end
    session[:user_id] = @user.id
    peeps_list
    return erb(:user_chitter)
  end

  get '/logout' do
    session[:user_id] = nil
    return redirect('/logout')
  end

  post '/new_peep' do
    if session[:user_id] == nil
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
    return erb(:user_chitter)
  end

  private

  def input_validation
    repo_users = UserRepository.new
    if ((params[:name].length == 0) || (params[:username].length == 0) || (params[:password].length == 0))
      @error = "Some essential information is missing."
    elsif params[:name].match?(/[^a-z\s-]{2,30}/i)
      @error = "Your name seems to be incorrect."
    elsif (params[:username].match?(/[^a-z\d]/i) || params[:username].length < 5)
      @error = "Your username can only contain letters and numbers, and must be between 5 and 16 characters long."
    elsif (!params[:email].include?('@') || params[:email].split("@")[-1] != 'makersacademy.com' || params[:email].split("@")[0].match?(/[^a-z\s-]{2,16}/i))
      @error = "Please use your Makers' email to create a Chitter account."
    elsif repo_users.email_exists?(params[:email])
      @error = "This email has already been registered."
    elsif repo_users.username_exists?(@params[:username])
      @username = params[:username]
      @error = "This username is already in use. Please choose a different one."
    end  
    return @error
  end

  def peeps_list
    @peep_repo = PeepRepository.new
    @peeps = @peep_repo.all.sort do |post|
      post.id
    end
  end
end
