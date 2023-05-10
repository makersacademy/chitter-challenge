require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/formatter'

DatabaseConnection.connect('chitter_site')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = PeepRepository.new
    @formatter = Formatter.new
    @peeps = repo.all_with_users.reverse

    return erb(:index)
  end

  post '/peep' do
    username = params['username']
    content = params['content']
    if user_exists(username)
      repo = PeepRepository.new
      peep = create_peep_object(username, content)
      repo.create(peep)
      @formatter = Formatter.new
      @peeps = repo.all_with_users.reverse
      return erb(:index)
    else
      @username = username
      status 400
      return invalid_peep_parameters? ? '' : erb(:unknown_username)
    end
  end

  get '/new_user' do
    return erb(:new_user)
  end

  post '/user' do
    if invalid_user_parameters?
      status 400
      return ''
    end
    begin
      repo = UserRepository.new
      user = User.new
      user.email = params['email']
      user.password = params['password']
      user.name = params['name']
      user.username = params['username']

      repo.create(user)
      return erb(:user_created)
    rescue RuntimeError => e
      @error_message = e.message
      status 400
      return erb(:new_user_error)
    end
  end

  private

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

  def create_peep_object(username, content)
    repo = PeepRepository.new
    peep = Peep.new
    peep.content = content
    peep.time = Time.now.strftime("%k:%M")
    peep.user_id = find_id(username)
    return peep
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
