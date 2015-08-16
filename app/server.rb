require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'
require 'sinatra/partial'

require_relative 'controllers/base.rb'
require_relative 'controllers/app.rb'
require_relative 'controllers/user.rb'

module Turing

  class Chitter < Sinatra::Base

    use Routes::AppRoute
    use Routes::UserRoute
    
    run! if app_file == $0
  end
end