require "sinatra"
require "sinatra/reloader"
require_relative "lib/database_connection"
require_relative "lib/user_repository"
require_relative "lib/peep_repository"
require "date"

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @title = "Chitter - Home"
    return erb(:index)
  end

  get '/peeps' do
    @title = "Chitter - Latest peeps"
    @peeps = PeepRepository.new.all
    return erb(:peeps)
  end

  get '/peeps/new' do
    @title = "Chitter - Create a new peep"
    return erb(:new_peep)
  end

  post '/peeps' do
    if invalid_peep_request_parameters?
      status 400
      return ''
    end

    repo = PeepRepository.new
    peep = Peep.new
    peep.content = params[:peep]
    peep.user_id = params[:user_id]

    repo.create(peep)
    return erb(:peep_created)
  end

  def invalid_peep_request_parameters?
    # Are the params nil?
    return true if params[:peep] == nil || params[:user_id] == nil
    # Are they empty strings?
    return true if params[:peep] == "" || params[:user_id] == ""
    return false
  end
end