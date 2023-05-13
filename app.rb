require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/display'

DatabaseConnection.connect('chitter_site')

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    peep_repo = PeepRepository.new
    user_repo = UserRepository.new
    @display = Display.new
    @peeps = peep_repo.all_with_users.reverse

    if session[:user_id] == nil
      return erb(:index)
    else
      @user = user_repo.find(session[:user_id])
      return erb(:user_homepage)
    end
  end

  post '/peep' do
    if invalid_peep_parameters?
      status 400
      return ''
    else
      begin
        user_exists(params['username'])
        post(new_peep)
      rescue RuntimeError
        @username = params['username']
        status 400
        return erb(:unknown_username)
      end
    end
  end

  get '/users/new' do
    return erb(:new_user)
  end

  get '/users/:id' do
    repo = UserRepository.new
    @user = repo.find_with_peeps(params[:id])
    @display = Display.new
    @peeps = @user.peeps.reverse

    return erb(:user_page)
  end

  post '/user' do
    if invalid_user_parameters?
      status 400
      return ''
    end
    sign_up(new_user)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    begin
      user_exists(params['username'])
      anyone_logged_in
      valid_password(params['username'], params['password'])
      login
    rescue RuntimeError => e
      status 400
      return e.message
    end
  end

  get '/logout' do
    logout
  end

  private

  def new_peep
    peep = Peep.new
    peep.content = params['content']
    peep.time = Time.now.strftime("%k:%M")
    peep.user_id = find_id(params['username'])
    return peep
  end

  def new_user
    user = User.new
    user.email = params['email']
    user.password = params['password']
    user.name = params['name']
    user.username = params['username']
    return user
  end

  def post(peep)
    peep_repo = PeepRepository.new
    user_repo = UserRepository.new
    peep_repo.create(peep)
    id = session[:user_id]

    @display = Display.new
    @peeps = peep_repo.all_with_users.reverse
    if id != nil
      @user = user_repo.find(id)
      return erb(:user_homepage)
    end
    return erb(:index)
  end

  def sign_up(user)
    begin
      repo = UserRepository.new
      repo.create(user)
      return erb(:user_created)
    rescue RuntimeError => e
      @error_message = e.message
      status 400
      return erb(:new_user_error)
    end
  end

  def login
    @username = params['username']
    user_id = find_id(@username)
    session[:user_id] = user_id

    return erb(:logged_in)
  end

  def logout
    session[:user_id] = nil
    return erb(:logout)
  end

  def invalid_peep_parameters?
    if [params[:content], params[:username]]
      .any? { |input| input.nil? || input.empty? }
      return true
    end
    return false 
  end

  def invalid_user_parameters?
    if [params[:email], params[:password],
      params[:name],params[:username]]
      .any? { |input| input.nil? || input.empty? }
      return true
    end
    return false 
  end

  def find_id(username)
    repo = UserRepository.new
    users = repo.all
    user = users.select do |user| 
      user.username == username
    end[0]

    return user.id
  end

  def user_exists(username)
    repo = UserRepository.new
    usernames = repo.all.map { |user| user.username }
    fail 'invalid username, go back!' if !usernames.include?(username)
    return true
  end

  def anyone_logged_in
    fail 'A user is already logged in' if session[:user_id] != nil
    return false
  end

  def valid_password(username, password)
    repo = UserRepository.new
    user_id = find_id(username)
    user = repo.find(user_id)
    fail 'Sorry! Incorrect password, please return' if user.password != password
    return true
  end
end
