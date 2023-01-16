# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    return erb(:index)
  end

  post '/peeps' do
    peep_content = params[:peep_content]
    time_posted = params[:time_posted]
    user_id = params[:user_id]
    peep_repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.peep_content = peep_content
    new_peep.time_posted = time_posted
    new_peep.user_id = user_id 
    return status 400 if valid_peep_parameters?(peep_content) == false
    peep_repo.create(new_peep)
    return "New peep: #{peep_content} was created at #{time_posted}"
  end

  get '/peeps' do
    peep_repo = PeepRepository.new
    @reverse_peeps = peep_repo.all.sort_by! { |peep| peep.time_posted }.reverse
    return erb(:peeps)
  end

  get '/users/:id' do
    id = params[:id]
    repo = UserRepository.new
    user = repo.find(id)
    @username = user.username
    @user_email = user.user_email
    return erb(:user)
  end

  def valid_peep_parameters?(peep)
    if peep.match(/^(?=.*[A-Z0-9])[\w.,!"'\/$ ]+$/i)
      return true
    else
      return false
    end
  end
end
