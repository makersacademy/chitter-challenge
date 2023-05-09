require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/maker_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
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

  post '/makers/new' do
    repo = MakerRepository.new
    maker = Maker.new
    maker.name = params[:name]
    maker.username = params[:username]
    maker.email_address = params[:email_address]
    maker.password = params[:email_address]

    if repo.all.any? { |row| row.username == maker.username }
      status 400
    else
      repo.create(maker)
      redirect '/'
    end
  end

  get '/loginpage' do
    return erb(:loginpage)
  end

  get '/maker/:id' do
    params[:id]
    return erb(:userpage)
  end
end
