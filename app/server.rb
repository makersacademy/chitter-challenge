require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require 'dm-core'
require 'dm-timestamps'

require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'helpers/application'

require_relative 'controllers/application'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

set :public_folder, Proc.new { File.join(root, '..', "public") }
enable :sessions
set :session_secret, 'top secret'
set :partial_template_engine, :erb
use Rack::Flash







