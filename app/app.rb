ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'data_mapper'
require 'pry'
require_relative 'models/user.rb'
require_relative 'models/peep.rb'
require_relative 'data_mapper_setup.rb'


require_relative 'controllers/peep'
require_relative 'controllers/user'
require_relative 'controllers/session'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial

  enable :sessions
  set :session_secret, 'super secret'

  set :root, File.dirname(__FILE__)
  set :partial_template_engine, :erb

enable :partial_underscores

  get '/' do
    @peeps = Peep.all.reverse
    erb :'peep/board'
  end


  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
