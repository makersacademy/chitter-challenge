require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/account_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Chitter < Sinatra::Base
  enable :sessions
  enable :raise_errors
  enable :dump_errors
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/'
  end

#   Homepage 

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
    
    accounts = AccountRepository.new

    return erb(:homepage)
  end

  #   Peeps 

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

  #   Sign up 

  get '/sign_up' do
    return erb(:sign_up)
  end

  post '/sign_up' do
    repo = AccountRepository.new
    account = Account.new
    encrypted_password = BCrypt::Password.create(params[:password])
    account.email_address = params[:email_address]
    account.name = params[:name]
    account.username = params[:username]
    account.password = encrypted_password
    
    if account.unique? 
      repo.add(account)
      return erb(:new_account_confirmation)
    else
      status 400
      return "This username and/or email address is already in use, please try again!"      
    end
  end

  #  Log in 

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    accounts = AccountRepository.new
    submitted_email = params[:email_address]
    submitted_password = params[:password]
    account = accounts.find_by_email_address(submitted_email)

    if account == nil
      status 400
      return erb(:login_fail)
    end

    stored_password = BCrypt::Password.new(account.password)

    if  stored_password == submitted_password && 
      session[:account_id] = account.id
      return erb(:login_success)
    else
      status 400
      return erb(:login_fail)
    end
  end

  #  Log out

  post '/log_out' do
    session[:account_id] = nil
    return erb(:logged_out)
  end
end
