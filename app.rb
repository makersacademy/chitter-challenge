require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require 'date'


DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps' do
    @peeps = PeepRepository.new.all
    return erb(:peeps)
  end

  get '/peeps/new' do
    return erb(:peeps_new)
  end

  post '/peeps' do
    
    # currently missing input validation check(s)

    peep = Peep.new         
    peep.content = params[:content]
    peep.date_time = DateTime.now.strftime('%d/%m/%Y %H:%M:%S')
    peep.user_f_name = params[:user_f_name]
    peep.user_handle = params[:user_handle]

    repo = PeepRepository.new
    repo.create(peep)

    return "Peep created!"
  end

end