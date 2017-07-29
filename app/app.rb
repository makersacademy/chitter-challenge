ENV['RACK_ENV'] ||= 'development'
require_relative 'chitter_setup'
require_relative './helpers/chitter_helpers'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  include ChitterHelpers

  get '/' do
    erb :index
  end

  run! if $PROGRAM_NAME == "lib/app.rb"
end

require_relative 'controllers/users'
require_relative 'controllers/peeps'
