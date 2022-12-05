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

  get '/makers' do
    repo = MakerRepository.new
    @makers = repo.all

    # response = @albums.map do |album|
    #   album.title
    # end.join(', ')

    return erb(:maker_list)
  end

  get '/signup/new' do

    return erb(:maker_create)
  end

  post '/signup' do
    p params

    if invalid__makers_params?
      status 400
      return ''
    end

    repo = MakerRepository.new
    new_user = Maker.new
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]

    repo.create(new_user)

    return ''
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    p params

    # if invalid__makers_params?
    #   status 400
    #   return 'WRONG'
    # end

    repo = MakerRepository.new
    user = repo.find_by_values(params[:email], params[:password])
    unless user.nil?
      session['user_id'] = user.id
      redirect '/makers'
    end

    status 401
    return 'Wrong user or password'
  end

  def invalid__makers_params?
    if params[:name] == nil
      puts "no name"
      return false
    end

    if params[:username] == nil
      puts "no username"
      return false
    end

    if params[:email] == nil
      puts "no email"
      return false
    end

    if params[:password] == nil
      puts "no password"
      return false
    end

      # return ( ||
      # params[:username] == nil ||
      # params[:email] == nil ||
      # params[:password] == nil)
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

    # list = albums.map do |artist|
    #   artist.name
    # end.join(', ')
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
end