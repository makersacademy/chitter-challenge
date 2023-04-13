require 'sinatra'
require "sinatra/reloader"
require 'bcrypt'
require_relative 'lib/database_connection'
require_relative 'lib/users_repository'
require_relative 'lib/peeps_repository'

DatabaseConnection.connect

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
#     also_reload 'lib/users_repository'
    also_reload 'lib/peeps_repository'
  end

  get '/' do
    peeps_repo = PeepRepository.new
    @peeps = peeps_repo.all
  
    # Debug statement
    # puts "@peeps: #{@peeps.inspect}"
  
    return erb(:peep)
  end  

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    username = params['username']
    name = params['name']
    email = params['email']
    password = params['password']
    password_hash = BCrypt::Password.create(password)
  
    UserRepository.new.create(username: username, name: name, email: email, password_hash: password_hash)
  
    redirect '/'
  end  
end