require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repo'
require_relative 'lib/peep_repo'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repo'
    also_reload 'lib/peep_repo'
  end
  
  get '/' do
    repo = PeepRepository.new
    peeps = repo.view_all
    @peeps = peeps.sort_by { |a, b, c| c }.reverse
    erb(:home)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    user = UserRepository.new
    success = user.sign_in(email, password)

    if success == true
      # Set the user ID in session
      # session[:user_id] = user.id
      "It's good"
      # return erb(:login_success)
    else
      "No banana"
      # return erb(:login_error)
    end
  end
end
