require 'bcrypt'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative './models/user'
require_relative './models/peep'

class Chitter < Sinatra::Base

  enable :sessions

  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  register Sinatra::Partial

  set :partial_template_engine, :erb
  enable :partial_underscores

  run! if app_file == $0

end

require_relative './controllers/peeps_controller'
require_relative './controllers/users_controller'
require_relative './controllers/sessions_controller'
