require 'sinatra'
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

  # def add_username_to_peep
  #   peeprepo = PeepRepository.new
  #   userrepo = UserRepository.new
  #   all_peeps = peeprepo.all
  #   @ready_peeps = []
  #   all_peeps.each do |peep|
  #     newpeep = Peep.new
  #     newpeep.id = peep.id
  #     newpeep.message = peep.message
  #     newpeep.post_time = peep.post_time
  #     newpeep.post_date = peep.post_date
  #     newpeep.user_id = peep.user_id
  #     newpeep.username = userrepo.find_by_id(peep.user_id)
  #     @ready_peeps << newpeep
  #   end
  #   p @ready_peeps
  #   return @ready_peeps
  #   return erb(:test)
  # end

  get '/home' do
    peeprepo = PeepRepository.new
    @peeps = peeprepo.all.reverse
    # @peeps = add_username_to_peep
    return erb(:home)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/users' do
    #add validation later
    repo = UserRepository.new
    newuser = User.new
    newuser.username = params[:username]
    newuser.password = params[:password]
    newuser.email = params[:email]
    repo.create(newuser)

    @allusers = repo.all
  end
end