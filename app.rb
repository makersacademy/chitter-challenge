require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base

  enable :sessions
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:homepage)
  end

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all.reverse

    erb(:all_peeps)
  end

  get '/peeps/new' do

    erb(:new_peeps)

  end

  post '/peeps' do

    user_repo = UserRepository.new
    peep_repo = PeepRepository.new

    user_id = user_repo.find_by_name(params[:name]).id

    peep = Peep.new
    peep.content = params[:content]
    peep.user_id = user_id

    peep_repo.create(peep)

    erb(:peep_sent)

  end

  get '/users/new' do

    erb(:new_users)
  end

  post '/users' do

    user_repo = UserRepository.new

    user = User.new
    user.name = params[:name]
    user.email_address = params[:email_address]

    user_repo.create(user)

    erb(:user_created)
  end

  get '/users/:id' do

    peep_repo = PeepRepository.new
    user_repo = UserRepository.new

    @user = user_repo.find(params[:id])
    

    @peeps = []


    all_peeps = peep_repo.all

    all_peeps.each do |peep|
      if peep.user_id == params[:id]
        @peeps << peep
      end
    end

    erb(:peep_by_user)
  end

end