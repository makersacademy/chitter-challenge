ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

class Chitter < Sinatra::Base
  require_relative 'controllers/users'
  require_relative 'controllers/sessions'
  require_relative 'controllers/peeps'
  require_relative 'data_mapper_setup'
  require_relative 'server'

  get '/' do
  @peeps = Peep.all
  erb :home
  end

  run! if app_file == $0

end
