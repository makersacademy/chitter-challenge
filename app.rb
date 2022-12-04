require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/peep'
require_relative 'lib/user'
require 'date'


DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps' do 
    repo = PeepRepository.new
    @peeps = repo.all

    return erb(:peeps)
  end 

  get '/peeps/create' do 
    return erb(:new_peep)
  end 

  post '/peeps/create' do 
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.message = params[:message]
    new_peep.created_at = DateTime.now
    new_peep.user_id = 1

    repo.create(new_peep)
    redirect('/peeps')
  end 

  get '/users/create' do 
    return erb(:sign_up)
  end 

  post '/users/create' do 
    repo = UserRepository.new
    new_user = User.new
    new_user.email_address = params[:email_address]
    new_user.password = params[:password]

    repo.create(new_user)
    redirect('/peeps')
  end

  get '/users/log_in' do
    return erb(:user_login)
  end 
end