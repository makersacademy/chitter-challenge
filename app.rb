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

  get '/' do
    peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @peeps = peep_repo.all.sort_by!{|peep| peep.time}.reverse!

    return erb(:index)
  end

  get'/signup' do
    return "sign up page"

  end


  get '/peeps' do
    peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @peeps = peep_repo.all.sort_by!{|peep| peep.time}.reverse!


    return erb(:peeps)
  end

  post '/peeps' do
    if invalid_peep_params? then
      status 400
      return 'Invalid peep details'
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


  post '/userpage' do

    if invalid_user_params? then
      status 400
      return 'Invalid user details'
    end

    username = params[:username]
    user_repo = UserRepository.new

    user = user_repo.find_by_username(username)

    redirect "/userpage/#{user.id}" 

  end

  get '/userpage/:id' do
    user_id = params[:id]

    @user_repo = UserRepository.new
    peep_repo = PeepRepository.new

    @user = @user_repo.find(user_id)
    @peeps = peep_repo.find_by_owner(@user.id)
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

end