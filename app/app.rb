require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'controllers/base'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

module BeefBurgers
  class Chitter < Sinatra::Base 
    use Routes::Users
    use Routes::Sessions
    use Routes::Peeps
    run! if app_file == $PROGRAM_NAME
  end
end