require "sinatra/base"
require "sinatra/reloader"
require "./lib/database_connection"
require_relative "lib/peep_repository"
require_relative "lib/user_repository"
require "date"
require "bcrypt"

DatabaseConnection.connect("chitter_test")

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload "lib/peep_repository"
    also_reload "lib/user_repository"
  end

  get "/peep/new" do
    @peeps = PeepRepository.new
    @users = UserRepository.new
    return erb(:homepage)
  end

  post "/peep/new" do
    new_peep = Peep.new

    new_peep.created = DateTime.now.strftime "%Y/%m/%d %H:%M"
    new_peep.content = params[:content]
    new_peep.user_id = session[:user_id]

    repo = PeepRepository.new

    repo.create(new_peep)
    return erb(:homepage)
  end

  get "/" do
    session.clear
    @peeps = PeepRepository.new
    @users = UserRepository.new
    return erb(:homepage)
  end

  get "/signup" do
    return erb(:signup)
  end

  post "/signup" do
    if (params[:email].empty? || params[:password].empty? || params[:name].empty? || params[:user_name].empty?)
      return erb(:signup)
    end

    @repo = UserRepository.new
    new_user = User.new

    new_user.id = params[:user_id]
    new_user.user_name = params[:user_name]
    new_user.name = params[:name]
    new_user.email = params[:email]
    new_user.password = params[:password]

    @repo.create(new_user)
    return redirect("/")
  end

  get "/login" do
    return erb(:login)
  end

  post '/login' do
    email = params[:email]
    submitted_password = params[:password]
    repo = UserRepository.new
    user = repo.find_by_email(email)
    if submitted_password == user.password
      session[:id] = user.id
      session[:name] = user.name
      session[:user_name] = user.user_name
    redirect ('/')
    else 
      return erb(:login)
    end
  end

end
