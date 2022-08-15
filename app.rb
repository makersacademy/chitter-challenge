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
      email = params[:email]
      password = params[:password]
      repo = UserRepository.new
      @user = repo.find_by_email(email)

      @user == nil || @user.password != password ? erb(:login_err) : erb(:login_success)
    end

    post '/peeps' do
      repo = PeepRepository.new
      new_peep = Peeps.new
      new_peep.id = params[:id]
      new_peep.content = params[:content]
      new_peep.date = params[:date]
      new_peep.user_id = params[:user_id]
      repo.create(new_peep)# {create new peep}
    
      return erb(:peep_success)
    end

    get '/peeps' do
        repo = PeepRepository.new
        @peeps = repo.all

        return erb(:peeps)
      end

end