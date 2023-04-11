require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
# require_relative 'lib/user_repository'
require 'erb'

DatabaseConnection.connect('chitter_database_test')

class Application < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    # also_reload 'lib/user_repository'
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all_reversed
    return erb(:homepage)
  end

  post '/post' do
    repo = PeepRepository.new
    new_peep = Peep.new

    user_input = params[:message]
    escaped_input = ERB::Util.html_escape(user_input)
    new_peep.message = escaped_input

    new_peep.time = Time.now.strftime("%Y-%m-%d %H:%M:%S")

    repo.create(new_peep)

    return redirect('/')

  end

  get '/signup' do
    return erb(:signup)
  end

  # post '/signup' do
  #   repo = UserRepository.new
  #   new_user = User.new

  #   new_user.name = params[:name]
  #   new_user.email = params[:email]
  #   new_user.username = params[:username]
  #   new_user.password = params[:password]

  #   repo.create(new_user)

  #   return redirect('/')
  # end

end
