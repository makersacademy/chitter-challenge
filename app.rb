# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/account_repository'
require 'bcrypt'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/account_repository'
  end

  get '/' do
    return erb(:homepage)
  end

  get '/feed' do
    @user_id = session[:user_id]
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all
    @account_repo = AccountRepository.new
    return erb(:feed)
  end

  get '/login' do
    return erb(:login_account)
  end
  # TO TEST
  post '/login' do
    email = params[:email]
    password = params[:password]
    @user = AccountRepository.new.find_by_email(email)
    if BCrypt::Password.create(@user.password) == @user.password
      session[:user_id] = @user.id
      return erb(:login_success)
    else
      return erb(:login_error)
    end
  end

  get '/logout' do
    return erb(:logout_account)
  end

  post '/logout' do
    session[:user_id] = nil
    return erb(:homepage)
  end


  get '/accounts' do
    account_repo = AccountRepository.new
    @accounts = account_repo.all
    return erb(:accounts)
  end

  get '/accounts/new' do
    return erb(:new_account)
  end
  # TO TEST
  get '/account_page' do
      repo = AccountRepository.new
      @account = repo.find(session[:user_id])
      repo = PeepRepository.new
      @peeps = repo.all
      return erb(:my_account)
  end

  get '/accounts/:id' do
    if session[:user_id] == params[:id]
      repo = AccountRepository.new
      @account = repo.find(params[:id])
      repo = PeepRepository.new
      @peeps = repo.all
      return erb(:my_account)
    else
      repo = AccountRepository.new
      @account = repo.find(params[:id])
      repo = PeepRepository.new
      @peeps = repo.all
      return erb(:not_my_account)
    end
  end

  get '/accounts/:id/peeps/new' do
    repo = AccountRepository.new
    @account = repo.find(params[:id])
    return erb(:new_peep)
  end

  post '/accounts/:id/peeps' do
    invalid_peep_parameters?
    repo = PeepRepository.new
    @new_peep = Peep.new
    @new_peep.contents = params[:contents]
    @new_peep.time = params[:time]
    @new_peep.account_id = params[:id]
    repo.create(@new_peep)
    return erb(:peep_created)
  end

  def invalid_peep_parameters?
    if params[:contents] == nil || params[:time] == nil || params[:account_id] == nil
      status 400
      return ''
    end
  end

  post '/accounts' do
    invalid_account_parameters?
    repo = AccountRepository.new
    @new_account = Account.new
    @new_account.email = params[:email]
    @new_account.password = params[:password]
    @new_account.name = params[:name]
    @new_account.username = params[:username]
    repo.create(@new_account)
    @id = repo.all.last.id
    return erb(:account_created)
  end

  def invalid_account_parameters?
    if params[:email] == nil || params[:password] == nil || params[:name] == nil || params[:username] == nil
      status 400
      return erb(:new_account)
    end
  end

end