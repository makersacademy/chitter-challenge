# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/peep'
require_relative 'lib/account'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/account_repository'
require 'pry'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/account_repository'
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all

    return erb(:home)
  end

  get '/accounts/:account_id' do
    account_id = params[:account_id]
    account_repository = AccountRepository.new 

    @account = account_repository.find(account_id)
    return erb(:account_id)
  end 

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    email = params[:email]
    password = params[:password]
    name = params[:name]
    username = params[:username]
    bio = params[:bio]

    account = Account.new
    account.email = email
    account.password = password
    account.name = name
    account.username = username
    account.bio = bio

    repo = AccountRepository.new

    if account.email.empty? || account.password.empty? || account.name.empty? || account.username.empty? || account.bio.empty?
      redirect '/signup'
    else
      repo.create(account)
      session[:account_id] = account.account_id
      redirect '/custom-timeline'
    end
  end

  get '/custom-timeline' do
    return erb(:login_success)
  end

  get '/login' do
    return erb(:login)
  end

  # post '/login' do
  #   email = params[:email]
  #   password = params[:password]

  #   account = AccountRepository.find_by_email(email)

  #   if account.password == password
  #     session[:account_id] = account.account_id
  #     return erb(:login_success)
  #   else
  #     return erb(:login_error)
  #   end
  # end

  post '/peep' do
    repo = PeepRepository.new
    content = params[:content]
    post_time = Time.now
    account_id = session[:account_id]

    peep = Peep.new
    peep.content = content
    peep.post_time = post_time
    peep.account_id = account_id

    repo.create(peep)
  end
end