require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/peep_repository'
require_relative './lib/account_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get "/" do
    redirect("/login")
  end

  get "/peeps" do
    peep_repository = PeepRepository.new
    account_repository = AccountRepository.new

    @peeps = peep_repository.all
    @authors = @peeps.map do |peep|
      account_repository.find(peep.account_id)
    end

    @account = session[:account_id].nil? ? nil : account_repository.find(session[:account_id])

    return erb(:peeps)
  end

  post "/peeps" do
    if params_nil?(params, [:contents, :account_id])
      return raise_error_view(
        ArgumentError.new("Cannot have empty fields in the peep form"),
        { path: "/peeps", message: "Return to Peeps" },
        400
      )
    end

    peep = Peep.new
    peep.contents = params[:contents]
    peep.time_posted = params[:time_posted]
    peep.account_id = params[:account_id]

    peep_repository = PeepRepository.new
    peep_repository.create(peep)

    return erb(:post_peep_confirmation)
  end

  get "/peeps/new" do
    if session[:account_id].nil?
      status 401
      return erb(:unauthorized_new_peep)
    else
      @account = AccountRepository.new.find(session[:account_id])
      return erb(:new_peep)
    end
  end

  get "/signup" do
    return session[:account_id].nil? ? erb(:signup_form) : redirect("/peeps")
  end

  post "/signup" do
    if params_nil?(params, [:email, :password, :name, :username])
      return raise_error_view(
        ArgumentError.new("Cannot have empty fields in the signup form"),
        { path: "/signup", message: "Return to signup page" },
        400
      )
    end

    account = Account.new
    account.email = params[:email]
    account.password = params[:password]
    account.name = params[:name]
    account.username = params[:username]

    account_repo = AccountRepository.new
    begin
      account_repo.create(account)
    rescue => error
      return raise_error_view(
        error,
        { path: "/signup", message: "Return to signup page" },
        400
      )
    end
    session[:account_id] = account_repo.find_with_username(account.username).id
    return erb(:post_account_confirmation)
  end

  get "/login" do
    return session[:account_id].nil? ? erb(:login_form) : redirect("/peeps")
  end

  post '/login' do
    if params_nil?(params, [:username, :password])
      return raise_error_view(
        ArgumentError.new("Cannot have empty fields in the login form"),
        { path: "/login", message: "Return to login page" },
        400
      )
    end
    begin
      @account = AccountRepository.new.find_with_username(params[:username])
      fail KeyError.new unless BCrypt::Password.new(@account.password) == params[:password]
    rescue KeyError
      status 400
      return erb(:failed_login)
    end
    session[:account_id] = @account.id
    return erb(:successful_login)
  end

  post "/logout" do
    if session[:account_id].nil?
      status 400
      return erb(:failed_logout)
    end

    session[:account_id] = nil
    return redirect("/login")
  end

  private 

  def params_nil?(hash, keys)
    return keys.any? { |key| hash[key.to_sym].nil? }
  end

  def raise_error_view(error, redirect, html_status)
    status html_status
    @error = error
    @redirect = redirect
    return erb(:error)
  end
end
