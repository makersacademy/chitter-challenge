# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/peep'
require_relative 'lib/account'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/account_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/account_repository'
  end

  get '/' do
    @peep_repo = PeepRepository.new
    @account_repo = AccountRepository.new

    return erb(:home)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    repo = AccountRepository.new
    new_account = Account.new

    new_account.email = params[:email]
    new_account.password = params[:password]
    new_account.name = params[:name]
    new_account.username = params[:username]
    new_account.bio = params[:bio]

    repo.create(new_account)

    account = repo.find_by_email(params[:email])
    session[:account_id] = account.id

    redirect '/logged_in'
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    account_repo = AccountRepository.new
    account_list = account_repo.all 

    existing_account = account_list.any? { |account| (account.email == params[:email]) and (BCrypt::Password.create(account.password) == params[:password])}

    if existing_account
      account = account_repo.find_by_email(params[:email])
      session[:account_id] = account.id

      redirect '/logged_in'
    else
      redirect '/login_error'
    end
  end

  get '/logged_in' do
    @peep_repo = PeepRepository.new
    @account_repo = AccountRepository.new

    erb(:login_success)
  end

  get '/login_error' do
    erb(:login_error)
  end

  post '/peep/new' do
    new_peep = Peep.new
    repo = PeepRepository.new

    new_peep.content = params[:content]
    new_peep.post_time = Time.new.strftime('%Y-%m-%d %H:%M:%S')
    new_peep.account_id = session[:account_id]

    repo.create(new_peep)

    redirect '/logged_in'
  end
end