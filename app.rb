require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/display'
require_relative 'lib/login_helper'

DatabaseConnection.connect('chitter_site')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    peep_repo = PeepRepository.new
    user_repo = UserRepository.new
    helper = LoginHelper.new
    @display = Display.new
    @peeps = peep_repo.all_with_users.reverse

    if helper.any_logged_in?(user_repo.all)
      id = helper.logged_in_user(user_repo.all)
      redirect "/#{id}"
    end
    return erb(:index)
  end

  post '/peep' do
    if invalid_peep_parameters? || !user_exists(params['username'])
      post_failed
    else
      post(new_peep)
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
    repo = UserRepository.new
    helper = LoginHelper.new
    @username = params['username']
    if !user_exists(@username)
      status 400
      return 'invalid username, go back!'
    elsif helper.any_logged_in?(repo.all)
      status 400
      return 'A user is already logged in'
    else
      login_attempt
    end
  end

  get '/logout' do
    logout
  end

  get '/:id' do
    peep_repo = PeepRepository.new
    user_repo = UserRepository.new
    @user = user_repo.find(params['id'])
    @display = Display.new
    @peeps = peep_repo.all_with_users.reverse

    return erb(:user_homepage)
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
    helper = LoginHelper.new
    peep_repo.create(peep)

    @display = Display.new
    @peeps = peep_repo.all_with_users.reverse
    id = helper.logged_in_user(user_repo.all)
    if id != nil
      @user = user_repo.find(id)
      return erb(:user_homepage)
    end
    return erb(:index)
  end

  def post_failed
    status 400
    @username = params['username']
    return invalid_peep_parameters? ? '' : erb(:unknown_username)
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

  def login_attempt
    helper = LoginHelper.new
    repo = UserRepository.new
    user_id = find_id(@username)
    if helper.check_password(user_id, params['password']) == false
      status 400
      return 'Sorry! Incorrect password, please return'
    end
    repo.change_login_status(user_id)
    return erb(:logged_in)
  end

  def logout
    repo = UserRepository.new
    helper = LoginHelper.new
    id = helper.logged_in_user(repo.all)
    repo.change_login_status(id)
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
    return usernames.include?(username)
  end
end
