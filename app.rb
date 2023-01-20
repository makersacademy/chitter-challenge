require 'sinatra/base'
require 'sinatra/reloader'

require './lib/user_model'
require_relative './lib/user_repository'
require_relative './lib/peep'
require_relative './lib/peep_repository'
require_relative './lib/database_connection'

DatabaseConnection.connect('chitter_db')


class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all.reverse!
    return erb(:index)
  end

  get '/sign_up' do 
    return erb(:sign_up)
  end

  get '/peep' do 
    return erb(:peep)
  end

  post '/sign_up' do 
    user_repo = UserRepository.new
    new_user = User.new
    new_user.email = params[:email]
    new_user.pass_word = params[:pass_word]
    new_user.username = params[:username]
    new_user.full_name = params[:full_name]

    user_repo.create(new_user)
  end 

  post '/peep' do 

    peep_repo = PeepRepository.new
    new_peep = Peep.new

    new_peep.content = params[:content]
    new_peep.time_created = Time.now
    new_peep.user_id = params[:user_id]

    return erb(:index)
  end 
end
