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

  get "/peeps" do
    peep_repository = PeepRepository.new
    account_repository = AccountRepository.new

    @peeps = peep_repository.all
    @authors = @peeps.map do |peep|
      account_repository.find(peep.account_id)
    end

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
    @accounts = AccountRepository.new.all
    return erb(:new_peep)
  end

  get "/signup" do

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
    return erb(:post_account_confirmation)
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
