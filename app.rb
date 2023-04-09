require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
# require '~/projects/makers/web-applications/chitter/lib/peep_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  attr_reader :logged_in, :current_id

  # def initialize
  #   @logged_in = false
  #   @current_id = 0
  # end

  get '/test' do
    p "****************HELLO*****************"
    return "hello"
  end

  get '/' do
    repo = PeepRepository.new
    peeps = repo.all_with_username
    @peep_info = peeps.map{ |peep| [peep.username, peep.time, peep.body, peep.tags]}
    return erb(:index)
  end

  get '/peeps/new' do
    @user_id = 2 # placeholder code for sending logged in user id!!!
    return erb(:add_peep)
  end

  post '/peeps' do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.body = params[:body]
    new_peep.time = Time.now.strftime("%Y-%m-%d %T")
    new_peep.tags = params[:tags]
    new_peep.user_id = params[:user_id] # placeholder code!!! maybe???
    repo.create(new_peep)
    return redirect('/')
  end

  get '/register/new' do
    return erb(:register)
  end

  post '/register' do
    user_repo = UserRepository.new
    new_user = User.new
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]
    user_repo.create(new_user)
    return redirect('/')
  end

  get '/login/form' do
    return erb(:login)
  end
end
