require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all_with_user

    return erb(:index)
  end

  get '/peeps/new' do
    return erb(:create_peep)
  end

  post '/peeps' do
    repo = PeepRepository.new
    peep = Peep.new
    peep.message = params[:message]
    peep.user_id = params[:user_id]
    repo.create(peep)
    return redirect('/')
  end

  # get '/peeps/:id' do
  #   # get single peep
  # end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    repo = UserRepository.new
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.name = params[:name]
    user.username = params[:username]

    repo.create(user)
    return erb(:signup_success)
  end

  get '/login' do
    return erb(:login)
  end
end
