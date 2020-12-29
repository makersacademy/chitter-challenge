require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require_relative './controllers/users_controller'
require_relative './controllers/peeps_controller'
require_relative './controllers/sessions_controller'
require_relative './lib/maker'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  use UsersController
  use PeepsController
  use SessionsController

  get '/' do
    redirect('/peeps')
  end

  run! if app_file == $0
end
