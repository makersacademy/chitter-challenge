require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/users_repo'
require_relative 'lib/peeps_repo'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
      also_reload 'lib/peeps_repo'
      also_reload 'lib/users_repo'
    end

    get '/' do
      return erb(:index) # Home page - Signup/login
    end

    post '/signup' do
      repo = UserRepository.new
      email = params[:email]
      # {create new user}
      if repo.find_by_email(email) == nil
        new_user = Users.new
        new_user.id = params[:id].to_i
        new_user.name = params[:name]
        new_user.username = params[:username]
        new_user.email = email
        new_user.password = params[:password]

        user = UserRepository.new
        user.create(new_user)
        return erb(:signup_success)
      else
        return erb(:signup_err) # if the user already exists/any issues 
      end
    end

    get '/login' do
        return erb(:login)
    end

    post '/login' do 
        return erb(:peeps)
        return erb(:login_err)
    end

    get '/peeps' do 
        return erb(:peeps)
    end

    post '/peeps' do
        # {create new peep}
        return erb(:new_peep)
    end





end