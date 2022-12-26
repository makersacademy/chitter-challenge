require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/maker_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/maker_repository'
    also_reload 'lib/peep_repository'
  end

  configure do
    enable :sessions
  end

  get '/makers' do
    @logged_in = logged_in?
    repo = MakerRepository.new
    @makers = repo.all

    return erb(:maker_list)
  end

  get '/signup' do

    return erb(:maker_create)
  end

  post '/signup' do
    if invalid_makers_params? == true
      status 400
      return ''
    end

    repo = MakerRepository.new
    if repo.find_by_name(params[:username]) == nil
      if repo.find_by_email(params[:email]) == nil

        new_user = Maker.new
        new_user.name = params[:name]
        new_user.username = params[:username]
        new_user.email = params[:email]
        new_user.password = params[:password]

        repo.create(new_user)

        redirect '/login'
      end
    end

    redirect '/signup'
  end

  get '/login' do
    logged_in = logged_in?
    maker_repo = MakerRepository.new
    @username = maker_repo.find_by_session_id(session[:session_id])
    return erb(:login)
  end

  post '/login' do
    repo = MakerRepository.new
    user = repo.find_by_values(params[:email], params[:password])
    unless user.nil?
      # session['user_id'] = user.id
      repo.update_session_id(user.id, session.id)
      redirect "/makers/#{user.id}"
    end

    status 401
    return 'Wrong user or password'
  end

  def invalid_makers_params?
      return (
        (params[:name] == "" || params[:name] == nil) ||
        (params[:username] == "" || params[:username] == nil) ||
        (params[:email] == "" || params[:email] == nil) ||
        (params[:password] == "" || params[:password] == nil)
)
  end

  # add validadtion for ID to make sure its a number

  get '/makers/:id' do
    repo = MakerRepository.new

    @makers = repo.find(params[:id])

    return erb(:maker_find)
  end

  get '/peeps' do
    repo = PeepRepository.new
    @peeps = repo.all.reverse

    return erb(:peep_list)
  end

  get '/peeps/new' do

    return erb(:peep_create)
  end

  post '/peeps' do
    if invalid__peeps_params?
      status 400
      return ''
    end

    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.peep = params[:peep]
    new_peep.time = params[:time]
    new_peep.maker_id = params[:maker_id]

    repo.create(new_peep)

    return ''
  end

  def invalid__peeps_params?
    return (params[:peep] == nil ||
      params[:time] == nil ||
      params[:maker_id] == nil)
  end

  get '/peeps/:id' do
    repo = PeepRepository.new

    @peeps = repo.find(params[:id])

    return erb(:peep_find)
  end

  def logged_in?
    repo = MakerRepository.new
    maker_id = repo.find_by_session_id(session['session_id'])
    return false if maker_id == nil
    return true if maker_id != nil
  end

end