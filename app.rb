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
  
  enable :sessions

  get '/' do
    @user = session[:user_email]
    repo = PeepRepository.new
    peeps = repo.view_all
    @peeps = peeps.sort_by { |a, b, c| c }.reverse
    erb(:home)
  end

  get '/login' do
    return erb(:login)
  end

  get '/logout' do
    session.clear
    return redirect('/')
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    repo = UserRepository.new
    success = repo.sign_in(email, password)

    if success == true
      user = repo.find_by_email(email)
      session[:user_email] = user['email']
      return redirect('/')
    else
      return erb(:login_error)
    end
  end
end
