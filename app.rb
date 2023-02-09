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

  def add_username_to_peep
    peeprepo = PeepRepository.new
    userrepo = UserRepository.new
    all_peeps = peeprepo.all


    @prepped_peeps = all_peeps.map { 
      |peep|
      peep.id = peep.id
      peep.message = peep.message
      peep.post_time = peep.post_time
      peep.post_date = peep.post_date
      peep.user_id = peep
    }
    @new_peeps = []
    all_peeps.each do |peep|
      peep.username = userrepo.find_by_id(peep.user_id)
      @new_peeps << peep
    end

    p @new_peeps
    return erb(:test)

  end

  get '/home' do
    peeprepo = PeepRepository.new
    @peeps = peeprepo.all.reverse
    return erb(:home)
  end
end