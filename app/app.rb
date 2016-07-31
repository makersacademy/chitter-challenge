ENV['RACK_ENV'] ||= 'development'


require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server'

require_relative 'datamapper_setup'

require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

class Chitter < Sinatra::Base

  get '/' do
    erb :'users/new'
  end

  run! if app_file == $0
end
