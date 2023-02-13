require './lib/database_connection'
require 'sinatra'
require "sinatra/reloader"
require './lib/peeprepository'
require './lib/peep'
require './lib/user'
require './lib/userrepository'

DatabaseConnection.connect

class Application < Sinatra::Base
# Sessions are disabled by default, so this line is needed.

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all
    return erb(:all_peeps)
  end

  get '/peeps/new' do
    if session[:user_id] == nil
      return erb(:login)
    else
      return erb(:new_peep)
    end
  end

  post '/peeps' do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.time = Time.now
    new_peep.user_id = params[:user_id]
    repo.create(new_peep)

    @peeps = repo.all
    return erb(:all_peeps)
  end

  get '/' do
    return erb(:index)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    repo = UserRepository.new
    new_user = User.new
    new_user.username = params[:username]
    new_user.name = params[:name]
    new_user.email = params[:email]
    new_user.password = params[:password]
    repo.create(new_user)

    return erb(:index)
  end

  get '/login' do
    if session[:user_id] == nil
      # No user id in the session
      # so the user is not logged in.
      return erb(:login)
    else
      # The user is logged in, display 
      # their account page.
    return redirect('/peeps/new')
    end
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    repo = UserRepository.new 
    user = repo.find_by_email(email)

    # This is a simplified way of checking the password. In a real project, you should encrypt the password
    # stored in the database.
    if user.password == password
      # Set the user ID in session
      session[:user_id] = user.id
      return erb(:new_peep)
    else
      return erb(:login_error)
    end
  end

  get '/logout' do
  session[:user_id] = nil
  return redirect "/"
  end
end
