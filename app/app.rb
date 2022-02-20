require 'pg'
require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/flash'
require_relative '../database_connection_setup'
require_relative '../lib/peep'
require_relative '../lib/user'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/peeps_controller'

class ChitterApp < Sinatra::Base
  use SessionsController
  use PeepsController 
  use UsersController

  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/peeps'
  end

end
