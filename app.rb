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
        # {create new user}
        return erb(:signup_err) # if the user already exists/any issues 
    end

    get '/login' do
        return erb(:login)
    end

    post '/login' do 
        return erb(:successful_login)
    end

    get '/peeps' do 
        return erb(:peeps)
    end

    post '/peeps' do
        # {create new peep}
        return erb(:new_peep)
    end







end