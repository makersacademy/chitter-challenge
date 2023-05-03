require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps_repository'
require './lib/user_repository'

class PeepsController < Sinatra::Base
  # Initialize ChitterDatabase
  DB = DatabaseConnection.connect('chitter_database')


  # Fetch all peeps and their respective users
  get '/peeps' do
    @peeps = PeepsRepository.new(DB).all_with_users
    erb :'peeps/index'
  end

  before do
    @peep_repo = PeepsRepository.new(DB)
    @user_repo = UserRepository.new
  end

  # Create a new peep
  post '/peeps' do
    user_id = session[:user_id]
    @peep_repo.create(params[:peep_content], user_id)
    redirect '/peeps'
  end
end

