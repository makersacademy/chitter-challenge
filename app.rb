require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/user'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_test')

# def reset_database_tables
#   seed_sql = File.read('spec/seeds/seeds_peeps_users.sql')
#   connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
#   connection.exec(seed_sql)
# end

class Application < Sinatra::Base
  # before(:each) do
  #   reset_database_tables
  # end
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  enable :sessions

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all.sort_by(&:date).reverse
    erb(:peeps)
  end

  post '/peeps' do
    if session[:user_id].nil?
      @peep = Peep.new
      @peep.content = params[:content]
      @peep.date = Time.now
      @peep.user_id = '1'
      repo = PeepRepository.new
      repo.add(@peep)
    else
      @peep = Peep.new
      @peep.content = params[:content]
      @peep.date = Time.now
      @peep.user_id = session[:user_id]
      repo = PeepRepository.new
      repo.add(@peep)
    end
    redirect '/peeps'
  end

  get '/post' do
    erb(:post)
  end

  get '/sign-up' do
    erb(:sign_up)
  end

  post '/users' do
    @user = User.new
    @user.name = params[:name]
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]
    repo = UserRepository.new
    repo.create(@user)
  end

  get '/sign-in' do
    erb(:sign_in)
  end

  post '/sign-in' do
    repo = UserRepository.new
    user = repo.find_by_email(params[:email])

    if repo.sign_in(params[:email], params[:password]) == true    
      session[:user_id] = user.id
      return erb(:sign_in_success)
    else
      return erb(:sign_in_error)
    end
  end
end