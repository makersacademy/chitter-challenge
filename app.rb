require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter_data')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  def initialize
    @current_user_id = nil
  end

  post "/sign_up" do
    new_user = User.new
    new_user.username = params['username']
    new_user.name = params['name']
    new_user.surname = params['surname']
    new_user.email = params['email']
    new_user.pass = params['pass']
    new_user.posts_amount = 0

    @user_repo = UserRepository.new
    @user_repo.create(new_user)
    ids = []
    @user_repo.all.each do |user|
      ids << user.id
    end
    ids.sort
    @current_user_id = ids[-1]
    return erb(:index)
  end

  get "/" do
    return erb(:log_in) if @current_user_id.nil?
    @peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    return erb(:index)
  end

  post "/send" do
    @peep_repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.content = params["content"]
    new_peep.date = "#{Time.now.day}/#{Time.now.mon}"
    new_peep.time = "#{Time.now.hour}:#{Time.now.min}"
    new_peep.user_id = @current_user_id

    @peep_repo.create(new_peep)
    return erb(:index)
  end

  

end