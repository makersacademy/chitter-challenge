require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  # ask coach why I had to put this for sessions to work for me, when others didn't
  use Rack::Session::Cookie, secret: "my_secret_key"

  configure :development do
    register Sinatra::Reloader
  end

  before do

    @user_repo = UserRepository.new ; @peep_repo = PeepRepository.new
  end

  get '/' do
    @peeps = @peep_repo.all_peeps ; users = @user_repo.all_users

    name1 = [] ; username1 = [] ; user_id = [] 
    
    p "is session nil #{session[:user].nil?}"
    p "session in / is #{session}"

    if session[:user] == nil
      @status = false
    else
      @status = true
    end

    users.each do |record|
      name1 << record.name ; username1 << record.username
    end

    @peeps.each do |record|
      user_id << record.user_id.to_i
    end

    @name = [] ; @username = []

    user_id.each do |id|
      @name << name1[id - 1]; @username << username1[id - 1]
    end
    return erb(:index)
  end

  get '/login' do
    return erb(:login)
  end

  get '/signup' do
    return erb(:signup)
  end

  get '/peep' do
    return erb(:peep_new)
  end

  get '/peep/:id' do
    peep_id = params[:id]
    peep = @peep_repo.find_peep(peep_id)
    @content = peep.content; @datetime = peep.datetime.split
    user_id = peep.user_id.to_i

    user = @user_repo.all_users[user_id-1]
    @name = user.name; @username = user.username
    return erb(:peep)
  end

  post '/login' do
    email_username = params[:email_username]; password = params[:password]
    user = @user_repo.sign_in(email_username, password)

    if user != false
      session[:user] = user
      return redirect('/')
    end

    return redirect('/login')
  end

  get '/logout' do
    session.clear
    return redirect('/')
  end

  post '/signup' do
    user = User.new
    user.email, user.password, user.name, user.username = params.values_at(:email, :password, :name, :username)
    
    new_user = @user_repo.create_user(user)

    return redirect('/signup') if new_user == false

    return redirect('/login')
  end

  post '/peep' do
    peep = Peep.new
    peep.content = params[:content]
    peep.user_id = session[:user].id
    @peep_repo.create_peep(peep)
    return redirect('/')
  end
end