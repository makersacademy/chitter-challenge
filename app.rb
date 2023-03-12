require "sinatra/base"
require "sinatra/reloader"
require_relative "lib/database_connection"
require_relative "lib/peep_repository"
require_relative "lib/peep"
require_relative "lib/user_repository"
require_relative "lib/user"
require "date"

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    
    register Sinatra::Reloader
    also_reload "lib/peep.rb"
    also_reload "lib/peep_repository.rb"
    also_reload "lib/user.rb"
    also_reload "lib/user_repository.rb"
  end

  get "/" do
    erb(:index)
  end

  get '/feed' do
    @peeps = PeepRepository.new.all.reverse
    @user_repo = UserRepository.new
    erb(:feed)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

   #create a new user
   post "/users" do
    repo = UserRepository.new
    new_user = User.new
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]
    repo.create(new_user)
    p repo.all
    return erb(:user_created)
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    users = []
    user_repo = UserRepository.new
    users << user_repo.find_by_email(email)

    if users[0].password == password && users[0].email == email
      user = users.first
      # response.set_cookie("user_id", value: user.id, expires: Time.now + 60*60*24*365 )
      session["user_id"] = user.id
      redirect '/login_home'
    else
      @error = true
      erb :login_failed
    end
  end

  get "/login_home" do
    if session[:user_id] == nil
      return redirect('/login')
    else
    @peeps = PeepRepository.new.all.reverse
    @user_repo = UserRepository.new

    erb (:login_home)
    end
  end

  #create a new peep
  post "/peeps" do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.message = params[:message]
    new_peep.time = DateTime.now
    new_peep.user_id = params[:user_id]
    repo.create(new_peep)
    redirect '/login_home'
  end

  get '/logout' do
    session.clear

    redirect '/'
  end
end
