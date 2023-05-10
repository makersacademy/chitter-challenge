require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/account_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Chitter < Sinatra::Base
  enable :sessions
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

  get '/sign_up' do
    return erb (:sign_up)
  end

  post '/sign_up' do
    repo = AccountRepository.new
    @account = Account.new
    @account.email_address = params[:email_address]
    @account.name = params[:name]
    @account.username = params[:username]
    @account.password = params[:password]

    repo.add(@account)

    return erb(:new_account_confirmation)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login'
end
