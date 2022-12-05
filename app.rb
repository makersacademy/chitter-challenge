require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do # the first default page on the site will prompt the user to signup
    return erb(:new_user)
  end

  get '/users' do
    repo = UserRepository.new
    @users = repo.all
    return erb(:users)
  end 

  post '/users' do # this method will allow the user to sign up and it will add their details to the database
    repo = UserRepository.new
    user = User.new
    user.name = params[:name]
    @user = params[:username]
    user.username = @user
    user.email = params[:email]
    user.password = params[:password]
    repo.create(user)
    
    redirect '/peeps'
  end

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all

    return erb(:peeps)
  end 

  get '/peep_form' do # peep form is a separate page to post a peep
    return erb(:peep_form)
  end

  post '/peeps' do # this will allow the user to post a peep with said parameters
    repo = PeepRepository.new
    peep = Peep.new
    peep.content = params[:content]
    @time = Time.now
    peep.time = @time
    peep.username = params[:username]
    repo.create(peep)
    @peeps = repo.all
    return erb(:peeps)
  end

  get '/login' do 
    return erb(:login)
  end 

  post '/login' do #using the login method below, it will allow the user to login to the site and it will redirect them to peeps
    login
    redirect '/peeps'
  end

  def login
    repo = UserRepository.new
    all = repo.all
    all.each do |user|
      if user.password != params[:password]
        return 'Incorrect Password!'
      elsif user.email != params[:email]
        return erb(:new_user) 
      else
        return erb(:peep_form)
      end
    end 
  end
end 