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

    return erb(:login_error) unless sign_in(email, password) == true

    session[:user_email] = email
    return redirect('/')
  end

  get '/new' do
    return erb(:new_error) if session[:user_email].nil?
    erb(:new_peep)
  end

  post '/new' do
    return erb(:new_error) if session[:user_email].nil?

    user = find_by_email(session[:user_email])
    
    peep = {
      content: params['content'],
      name: user['name'],
      username: user['username']
    }

    create(peep)
  end

  private

  def sign_in(email, password)
    repo = UserRepository.new
    begin
      return repo.sign_in(email, password)
    rescue => e
      puts "error: #{e}"
      false
    end
  end

  def find_by_email(email)
    repo = UserRepository.new
    repo.find_by_email(email)
  end

  def create(peep)
    repo = PeepRepository.new
    begin
      repo.create(peep)
      redirect('/')
    rescue => e
      puts "error: #{e}"
      @error = e
      erb(:error)
    end
  end
end
