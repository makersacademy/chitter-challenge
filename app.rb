require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/peep'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    return erb(:homepage)
  end

  get '/peeps' do
    peep_repository = PeepRepository.new
    @peeps = peep_repository.all
    return erb(:peeps)
  end
 
  get '/peeps/new' do
   return erb(:create_peep)
  end

  post '/peeps' do
    if invalid_param?
      status 400
      # redirect '/peeps/new'
      return erb(:create_peep)
    end
    peep = Peep.new
    repository = PeepRepository.new
    peep.content = params[:content]
    peep.user_id = params[:user_id]
    repository.create(peep)
    return erb(:peep_created)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    if invalid_param?
      status 400
      # redirect '/peeps/new'
      return erb(:signup)
    end
    user = User.new
    repository = UserRepository.new
    user.name = params[:name]
    user.username = params[:username]
    user.email_address = params[:email_address]
    user.password = params[:password]
    return erb(:account_created)
  end

  def invalid_param?
    return true if params[:content] == ""
    return true if params[:user_id] == ""
    return true if params[:name] == ""
    return true if params[:username] == ""
    return true if params[:email_address] == ""
    return true if params[:password] == ""
  end

end