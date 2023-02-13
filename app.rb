require 'sinatra'
require_relative 'lib/database_connection'
require_relative './lib/user_repository'
require_relative './lib/peep_repository'
require_relative './lib/peep'
require_relative './lib/user'
require 'rack/test'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base

  def set_all_peeps
    peep_repo = PeepRepository.new
    user_repo = UserRepository.new
    peeps = peep_repo.all.reverse!
    users = user_repo.all
    @all_peeps = []

    peeps.each do |peep|
      message = peep.message
      user = users.select { |user| user.id == peep.user_id}

      peep_data = {
        message: peep.message,
        time_posted: peep.time_posted,
        user_id: peep.user_id,
        name: user[0].username,
        email: user[0].email,
        pass_word: user[0].pass_word,
        username: user[0].username
      }

      @all_peeps << peep_data
    end
  end

  get '/' do
    set_all_peeps
    erb(:index)
  end

  get '/sign-up' do
      erb(:sign_up)
  end

  post '/sign-up' do
    user_repo = UserRepository.new
    new_user = User.new
  end

  get '/peep' do
    erb(:peep)
  end

  post '/peep' do
    new_peep = Peep.new
    peep_repo = PeepRepository.new
    user_repo = UserRepository.new

    new_peep.message = params[:message]
    new_peep.time_posted = Time.now.strftime("%Y-%m-%d %H:%M:%S")

    users = user_repo.all
    user = users.select { |user| user.username == params[:username] }

    if user.empty?
      "No user found with username: #{params[:username]}"
    else
      new_peep.user_id = user[0].id
      peep_repo.create(new_peep)
      set_all_peeps
      erb(:index)
    end
  end
end
