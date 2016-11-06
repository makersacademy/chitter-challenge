require 'sinatra'
require 'data_mapper'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'models/user'
require_relative 'models/peep'

require_relative 'controllers/app'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/peeps'

require_relative 'helpers/session_helper'
require_relative 'datamapper_setup'

set :public_folder, proc { File.join(root, '..', 'public') }

enable :sessions
register Sinatra::Flash
register Sinatra::Partial
use Rack::MethodOverride
set :session_secret, 'Super Secret Encrypted Key'
set :partial_template_engine, :erb

enable :partial_underscores
