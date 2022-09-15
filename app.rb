require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require 'date'
require 'cgi'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @current_year = DateTime.now.strftime('%Y')
    return erb(:index)
  end

  get '/peeps' do
    @peeps = PeepRepository.new.all
    return erb(:peeps)
  end

  get '/peeps/new' do
    return erb(:peeps_new)
  end

  get '/peeps/posted' do
    return erb(:peeps_posted)
  end

  post '/peeps' do
    
    # currently missing input validation check(s)

    peep = Peep.new         
    peep.content = CGI::escapeHTML(params[:content])
    peep.date_time = DateTime.now.strftime('%d/%m/%Y %H:%M:%S')
    # these 2 assignments will eventually not be needed
    peep.user_f_name = params[:user_f_name]
    peep.user_handle = params[:user_handle]

    repo = PeepRepository.new
    repo.create(peep)

    return erb(:peeps_posted)
  end

end