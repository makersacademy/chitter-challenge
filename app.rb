require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter_site')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all

    return erb(:home)
  end

  post '/peep' do
    username = params['username']
    if user_exists(username)
      repo = PeepRepository.new
      peep = Peep.new
      peep.content = params['content']
      peep.time = Time.now.strftime("%k:%M")
      peep.user_id = find_id(username)

      repo.create(peep)
      @peeps = repo.all

      return erb(:home)
    else
      status 400
      @username = username
      return erb(:unknown_username)
    end
  end

  private

  # returns an array of the authors
  # of peeps given an array of the peeps
  def author(peep)
    repo = UserRepository.new
    id = peep.user_id
    user = repo.find(id)
    return { name: user.name, username: user.username }
  end

  # gets the user ID based from the username given
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
