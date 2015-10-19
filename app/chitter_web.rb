require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require './app/helpers/current_user'
require './app/controllers/base_controller'
require './app/controllers/user_controller'
require './app/controllers/peep_controller'
require './app/controllers/reply_controller'

include ChitterApp::Models
module ChitterApp
  class Chitter < Sinatra::Base
    include CurrentUser
    use Routes::UserController
    use Routes::PeepController
    use Routes::ReplyController
    register Sinatra::Flash
    get '/' do
      erb :index
    end
  end
end
