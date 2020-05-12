require 'bcrypt'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/user'
require_relative './models/peep'

class Chitter < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  enable :sessions

  register Sinatra::Flash

  run! if app_file == $0

end

require_relative './controllers/peeps_controller'
require_relative './controllers/users_controller'
require_relative './controllers/sessions_controller'
