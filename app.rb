require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/account_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/account_repository'
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
    
    @accounts = AccountRepository.new

    return erb(:homepage)
  end

  get '/add_peep' do
    return erb(:add_a_peep)
  end

  post '/add_peep' do
    repo = PeepRepository.new
    peep = Peep.new
    peep.time = Time.now
    peep.contents = params[:contents]
    peep.account_id = '1'

    repo.add(peep)

    return erb(:posted_peep)
  end
end
