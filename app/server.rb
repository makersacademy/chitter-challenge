require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require_relative 'models/data_mapper_setup'
require_relative 'models/send_mail'

class Chitter < Sinatra::Base
  use Rack::Flash
  use Rack::MethodOverride
  include Rack::Utils
  enable :sessions
  get '/' do
    session[:page] = '/'
    @cheeps = Cheep.all
    @user = User.first(id: session[:user_id])
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end

require_relative 'controllers/user_management'
require_relative 'controllers/send_cheep'
require_relative 'controllers/social'
