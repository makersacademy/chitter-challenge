require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
		also_reload 'lib/peep_repository'
  end

  get '/' do
    return erb(:homepage)
  end

  # THIS ISN'T WORKING
  post '/' do
    email = params[:email]
    password = params[:password]

    p user = UserRepository.new.find_by_email(email)
    p user != ''
    p user.password == password

    if user.password == password || user != ''
      session[:user_id] = user.id
      return erb(:login_success)
    else
      status 400
      return erb(:login_error)
    end
  end
end 
