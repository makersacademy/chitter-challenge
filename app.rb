require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative './lib/user_repository'
require_relative './lib/peep_repository'
require_relative './lib/peep'
require_relative './lib/user'
require 'rack/test'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base

  # enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  def set_all_peeps
    peep_repo = PeepRepository.new
    user_repo = UserRepository.new
    peeps = peep_repo.all.reverse!
    users = user_repo.all
    @all_peeps = []

    peeps.each do |peep|
      message = peep.message
      user = users.select { |user| user.id == peep.user_id}
      if user[0]
      peep_data = {
        message: peep.message,
        time_posted: peep.time_posted,
        user_id: peep.user_id,
        name: user[0].name,
        email: user[0].email,
        pass_word: user[0].pass_word,
        username: user[0].username
      }

      @all_peeps << peep_data
    end
    end
  end

  get '/' do
    set_all_peeps
    return erb(:index)
  end

  get '/welcome' do
    return erb(:welcome)
  end

  get '/sign-up' do
    return erb(:signup)
  end

  post '/sign-up' do
    user_repo = UserRepository.new
    new_user = User.new
    new_user.id = params[:id]
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.pass_word = params[:pass_word]

    user_repo.create(new_user)

    return erb(:login)
  end

  get '/peep' do
    return erb(:peep)
  end

  post '/peep' do
    # if session[:user_id]
      new_peep = Peep.new
      peep_repo = PeepRepository.new
  
      new_peep.message = params[:message]
      new_peep.time_posted = Time.now.strftime("%Y-%m-%d %H:%M:%S")
      new_peep.user_id = session[:user_id]
  
      peep_repo.create(new_peep)
      redirect '/'
    else
      redirect '/log-in'
    end
  end
end