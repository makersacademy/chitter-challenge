require 'sinatra'
require "sinatra/reloader" if development?
require 'pg'
require './lib/peep'
require './lib/user'
require './database_connection_setup'
require 'sinatra/flash'
require 'action_view'
require_relative './controllers/peep_controller'
require_relative './controllers/user_controller'
require_relative './controllers/reply_controller'
require_relative './controllers/session_controller'

include ActionView::Helpers::DateHelper

class Chitter < Sinatra::Base

  use PeepController
  use UserController
  use ReplyController
  use SessionController

  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash
  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  # Start the server if this file is executed directly 
  run! if app_file == $0
end
