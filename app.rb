require 'sinatra/base'
require 'sinatra/reloader'
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
    if post_inputs_nil?(params)
      status 400
      @error = ArgumentError.new "Cannot have empty fields in the peep form"
      return erb(:post_peep_error)
    end
  end
end

def post_inputs_nil?(parameters)
  return params[:contents].nil? || params[:author_id].nil?
end
