require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  get '/users/new' do
    @new_user = params[:user_name]
    return erb(:new_user)
  end

  get '/peeps/new' do
    @new_peep = params[:peep_title]
    return erb(:new_peep)
  end

  get '/peeps' do
    repo = PeepRepository.new

    @peeps = repo.sorted_by_time

    return erb(:peeps)
  end

  post '/peep' do
    repo = PeepRepository.new
    @new_peep = Peep.new
    @new_peep.title = params[:title]
    @new_peep.content = params[:content]
    @new_peep.time = params[:time]

    repo.create(@new_peep)

    return erb(:peep_created)
  end

  post '/user' do
    repo = UserRepository.new
    @new_user = User.new
    @new_user.name = params[:name]
    @new_user.username = params[:username]
    @new_user.email = params[:email]
    @new_user.password = params[:password]

    repo.create(@new_user)

    return erb(:user_created)
  end

  post '/login' do
    repo = UserRepository.new
    email = params[:email]
    password = params[:password]
    p email
    p password
    user = repo.find_by_email(email)
    p user
    if user.password == password
      p user.password == password
      #session[:user_id] = user.id

      return erb(:login_success)
    else
      return erb(:login_error)
    end
  end
end
