require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'
require 'sinatra/partial'

require_relative 'controllers/base.rb'
require_relative 'controllers/app.rb'
require_relative 'controllers/user.rb'
require_relative 'controllers/session.rb'
require_relative 'controllers/peep.rb'

module Turing

  class Chitter < Sinatra::Base

    use Routes::AppRoute
    use Routes::UserRoute
    use Routes::SessionRoute
    use Routes::PeepRoute
    
    run! if app_file == $0
  end
end