require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps_repository'
require './lib/user_repository'

class PeepsController < Sinatra::Base
  # Initialize ChitterDatabase
  DB = DatabaseConnection.connect('chitter_database')


  # Fetch all peeps and their respective users
  get '/peeps' do
    @peeps = DatabaseConnection.query("SELECT p.id, p.peep_content, u.username, p.time_of_peep FROM peeps p INNER JOIN users u ON p.user_id = u.id ORDER BY p.time_of_peep DESC;")
    erb :'/peeps'
  end

  before do
    @peep_repo = PeepsRepository.new(DB)
    @user_repo = UserRepository.new
  end

  # Create a new peep
  post '/peep' do
    user_id = session[:user_id]
    @peep_repo.create(params[:peep_content], user_id)
    redirect '/peeps'
  end
end

