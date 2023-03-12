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
  configure :development do
    register Sinatra::Reloader
    also_reload "lib/peep.rb"
    also_reload "lib/peep_repository.rb"
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

  get '/login' do
    erb(:login)
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
  return erb(:user_created)
end

  #create a new peep
  post "/peeps" do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.message = params[:message]
    new_peep.time = DateTime.now
    new_peep.user_id = params[:user_id]
    repo.create(new_peep)
    return redirect("/")
  end


end
