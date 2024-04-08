require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/peep_user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
  end

  enable :sessions

  get '/peeps' do
    session[:user_id] = nil # TODO
    @peeps = PeepRepository.new.all_with_poster
    @peeps = @peeps.sort_by{|peep| peep.id}.reverse
    return erb :peeps, :layout => :main_layout
  end

  get '/peeps/:id' do
    session[:user_id] = nil  # TODO
    @peeps = []
    @peeps << PeepRepository.new.find_with_poster(params[:id])
    return erb :peeps, :layout => :main_layout
  end

  get '/signup' do
    return erb :signup, :layout => :main_layout
  end

  post '/signup' do
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.username = params[:username]
    user.password = params[:password]
    result = UserRepository.new.create(user)
    if result != 'success'
      @error_message = result
      return erb :signup_failure, :layout => :main_layout
    else
      return erb :signup_success, :layout => :main_layout
    end
    
  end
end
