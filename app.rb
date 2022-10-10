require 'sinatra/base'
require 'sinatra/reloader'
require'./lib/database_connection.rb'
require './lib/user_repository'
require './lib/user'
require './lib/peep_repository'
require './lib/peep.rb'

DatabaseConnection.connect('chitter_test')
  enable :sessions
class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end


    get '/' do
        
        return erb(:homepage)
    end

    get '/peeps' do
        peep = PeepRepository.new
        user = UserRepository.new
        @peeps = peep.all.sort_by(&:time_stamp).reverse
        @users = user.all
        return erb(:peeps)
    end

    get '/peeps/new' do
      return erb(:make_peep)
    end

    post '/peeps/new' do
     repo = PeepRepository.new

     peep = Peep.new
     peep.message = params[:message]
     peep.time_stamp = params[:time_stamp]
     peep.user_id = params[:user_id]
     repo.create(peep)
     return erb(:peep_made)
    end

    get '/signup' do
      return erb(:signup)
    end

    post '/signup' do
      repo = UserRepository.new

      user = User.new
      user.name = params[:name]
      user.username = params[:username]
      user.email = params[:email]
      user.password = params[:password]
      
      repo.create(user)

      return erb(:account_created)
    end

end