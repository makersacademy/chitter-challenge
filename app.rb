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
    @peeps = peeps.sort_by { |_, _, c| c }.reverse
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

    success = sign_in(email, password)

    return erb(:login_error) unless success == true

    repo = UserRepository.new
    user = repo.find_by_email(email)
    session[:user_email] = user['email']
    return redirect('/')
  end

  private

  def sign_in(email, password)
    repo = UserRepository.new
    begin
      return repo.sign_in(email, password)
    rescue => e
      puts "error: #{e}"
      return false
    end
  end
end

