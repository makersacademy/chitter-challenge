require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative './helpers'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  set :session_secret, 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial

  require_relative './models/send_tag_alert'
  require_relative 'controllers/account'
  require_relative 'controllers/peeps'

  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers Helpers

  run! if app_file == $0
end
