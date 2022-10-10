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

    # Homepage
  get '/' do
    user_repo = UserRepository.new
    peep_repo = PeepRepository.new
    @user = user_repo.all
    @peeps = peep_repo.all
    return erb(:homepage)
  end

  # <h5><%= @user.name %></h5>

  # Signup page
  get '/signup' do
    return erb(:signup)
  end

  # Successfully signed up -> link to home page
  post '/signup' do
    if invalid_request_signup?
      status 400
      return ''
    end

    repo = UserRepository.new
    new_user.id = params[:id]
    new_user.email = params[:email]
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.password = params[:password]
    repo.create(new_user)
    return erb(:signup_success)
      # (see if i can redirect page automatically to homepage)
  end

  get '/user' do
    return erb(:user_list)
  end

  get '/user/:id' do
    peep_repo = PeepRepository.new
    user_repo = UserRepository.new
    # @peep = peep_repo.find(@peep.user_id)
    @user = user_repo.find(params[:id])
    return erb(:users)
  end


  get '/newpeep' do
    return erb(:newpeep)# page for new peeps(messages) - see if i can make it popup on the same page instead
  end

  post '/newpeep' do
    if invalid_request_peep?
      status 400
      return ''
    end
    repo = PeepRepository.new
    new_peep.id = params[:id]
    new_peep.content = params[:content]
    new_peep.user_id = params[:user_id]
    return # New peep added -> see if i can redirect back to home page 
  end
end

private 

# Error Status methods
def invalid_request_signup?
  params[:email] == nil? || params[:name] == nil? || params[:username] == nil? || params[:password] == nil?
end

def invalid_request_peep?
  params[:content] == nil?
end
