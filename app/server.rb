require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'

require_relative 'models/note'
require_relative 'models/user'
require_relative 'models/reply'
require_relative 'models/tag'

require_relative 'helpers/application'

require_relative 'controllers/application'
require_relative 'controllers/notes'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/search'

enable :sessions
set :session_secret, 'super_secret'

use Rack::Flash

set :public_dir, proc { File.join(root, "public") }
set :public_folder, 'public'
