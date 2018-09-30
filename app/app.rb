require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'sinatra/partial'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  set :session_secret, 'super secret'
  register Sinatra::Flash

  require_relative 'server'
  require_relative 'controllers/login'
  require_relative 'controllers/logout'
  require_relative 'controllers/peeping'
  require_relative 'controllers/signup'
  require_relative 'controllers/replying'

  run! if app_file == $0
end
