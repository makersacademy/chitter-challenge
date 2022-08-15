require "sinatra"
require "sinatra/reloader"
require "time"
require_relative "lib/database_connection"
require_relative "lib/user_repo"
require_relative "lib/peep_repo"


DatabaseConnection.connect('chitter')

class Application < Sinatra::Base

  configure :development do 
    register Sinatra::Reloader
  end

  get "/" do 
    erb(:index)
  end

  get "/posts" do
    peep_repo = PeepRepository.new 
    @peeps = peep_repo.all
    @user_repo = UserRepository.new 

    return erb(:posts)
  end

  get '/post/new' do 
    erb(:new_post)
  end

  get "/signup/new" do   
    erb(:new_user)
  end

  post "/signup" do
    repo = UserRepository.new 

    user = User.new 
    user.name = params[:name]
    user.username = params[:username]
    user.email = params[:email]
    user.password = params[:password]

    repo.create(user)

    return "You have successfully signed up for Chitter!" # => can do with a erb(:signuppage)
  end

  post "/post" do # => set by default for now to be sent from starkent (Tony)
    repo = PeepRepository.new 
    peep = Peep.new 
    peep.content = params[:peep]
    time = Time.now
    peep.timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
    peep.user_id = 3 # => can do with a .find_by_name(name) to get user_id?
    @name = params[:name]
    repo.create(peep)

    "Your peep has been sent!"
    
  end

end

