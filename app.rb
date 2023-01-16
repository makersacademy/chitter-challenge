require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository' 

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload "lib/peep_repository"
    also_reload "lib/user_repository"
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
    return erb(:home)
  end

  get "/send_a_peep" do
    return erb(:new_peep_form)
  end

  get "/sign_up" do
    return erb(:sign_up_form)
  end

  post "/signed_up" do
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]
    rep_password = params[:rep_password]
    if password == rep_password
        new_user = User.new
        new_user.name = name
        new_user.username = username
        new_user.email = email
        new_user.password = password
        UserRepository.new.create(new_user)
        return erb(:new_user_created)
    else
      return erb(:password_fail)
    end
  end
  
  get "/logged_in" do
    repo = PeepRepository.new
    @peeps = repo.all
    return erb(:logged_in)
  end

  post "/post_peep" do
  t = Time.new
  # now = t.strftime(“%k:%M %d/%m/%Y”)
    peep = params[:peep]
    new_peep = Peep.new
    new_peep.peep_content = peep
    new_peep.peep_date = "#{t}"
    new_peep.username = "anonymous"
    new_peep.user_id = 3 #how do I grab id from logged in person 
    PeepRepository.new.create(new_peep)
    return erb(:home)
  end






end

# t = Time.new
# puts t.strftime(“%k:%M %d/%m/%Y”)
