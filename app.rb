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
    @peeps = repo.all
    return erb(:homepage)
  end

  post '/post' do
    repo = PeepRepository.new
    new_peep = Peep.new

    user_input = params[:message]
    escaped_input = ERB::Util.html_escape(user_input)
    new_peep.message = escaped_input

    new_peep.time = Time.now.strftime("%Y-%m-%d %H:%M:%S")

    p new_peep

    repo.create(new_peep)

    return redirect('/')
  end

end