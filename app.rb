# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  # ------------- Homepage Route ----------------------------------------

  get '/' do
    peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @peeps = peep_repo.all.sort_by!{|peep| peep.time}.reverse!

    return erb(:index)
  end

  # ------------- Sign Up Routes ----------------------------------------

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do

    users = UserRepository.new
    
    if users.all.any?{|user| user.email == params[:email]} then
      status 400
      return "Email address already signed up."
    end

    if users.all.any?{|user| user.username == params[:username]} then
      status 400
      return "Username already taken, please choose another."
    end

    if invalid_signup_params? || invalid_user_params? then
      status 400
      return 'Invalid credentials, please try again.'
    end

    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.username = params[:username]

    users.create(user)

    user = users.find_by_username(user.username)
    redirect "/userpage/#{user.id}"

  end

  # ------------- Peeps Routes ----------------------------------------

  get '/peeps' do
    peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @peeps = peep_repo.all.sort_by!{|peep| peep.time}.reverse!

    return erb(:peeps)
  end

  post '/peeps' do
    if invalid_peep_params? then
      status 400
      return 'Invalid peep, please try again.'
    end

    peep = Peep.new
    peep_repo = PeepRepository.new
    @user_repo = UserRepository.new


    peep.content = params[:content]
    peep.time = DateTime.now
    peep.user_id = params[:user_id]

    peep_repo.create(peep)

    @peeps = peep_repo.all.sort_by!{|peep| peep.time}.reverse!


    return erb(:peeps)
    
  end


  # ------------- User Page Routes ----------------------------------------


  post '/userpage' do

    if invalid_user_params? then
      status 400
      return 'Invalid user details.'
    end

    user_repo = UserRepository.new

    if !user_repo.all.any?{|user| user.username == params[:username]} then
      status 400
      return "Username does not exist, please try again."
    end

    username = params[:username]

    user = user_repo.find_by_username(username)

    redirect "/userpage/#{user.id}" 

  end

  get '/userpage/:id' do
    user_id = params[:id]

    @user_repo = UserRepository.new
    peep_repo = PeepRepository.new

    @user = @user_repo.find(user_id)
    @peeps = peep_repo.find_by_owner(@user.id).sort_by!{|peep| peep.time}.reverse!
    @tagged_peeps = peep_repo.find_by_tagged_user(@user.id)

    return erb(:userpage)
    
  end

  def invalid_user_params?
    params[:username] == nil ||  params[:username].match?(/[^a-zA-Z0-9 ]/) ||  
    params[:password] == nil || params[:password] == "" 
  end

  def invalid_peep_params?
    params[:content] == nil ||  params[:content]== "" 
  end

  def invalid_signup_params?
    params[:name] == nil ||  params[:name].match?(/[^a-zA-Z0-9 ]/) ||
    params[:email] == nil ||  !params[:email].match?(/[@]/)
  end

end