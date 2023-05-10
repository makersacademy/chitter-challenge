require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/maker_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/maker_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    return erb(:homepage)
  end

  get '/peeps' do
    peep_repo = PeepRepository.new
    @maker_repo = MakerRepository.new
    @all_peeps = peep_repo.all
    return erb(:peeps)
  end

  get '/signup' do
    return erb(:signuppage)
  end

  post '/signup' do
    repo = MakerRepository.new
    maker = Maker.new
    maker.name = params[:name]
    maker.username = params[:username]
    maker.email_address = params[:email_address]
    maker.password = params[:email_address]

    if repo.all.any? { |row| row.username == maker.username }
      status 400
    elsif repo.all.any? { |row| row.email_address == maker.email_address }
      status 400
    elsif maker.name == nil || maker.username == nil || maker.email_address == nil || maker.password == nil
      status 400
    elsif maker.name.empty? || maker.username.empty? || maker.email_address.empty? || maker.password.empty? 
      status 400
    else
      repo.create(maker)
      redirect '/loginpage'
    end
  end

  get '/loginpage' do
    return erb(:loginpage)
  end

  post '/loginpage' do
    username = params[:username]
    password = params[:password]
    repo = MakerRepository.new
    @maker = repo.find_by_username(username)
    
    if @maker.password == password
      session[:maker_id] = @maker.id
      return erb(:userpage)
    else
      return erb(:login_error)
    end
  end
end
