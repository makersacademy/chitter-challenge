require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'
require './app/helpers/user_helper.rb'
require 'sinatra/partial'

Dir["./app/controllers/*.rb"].each {|file| require file }

include Chitter

module Chitter

  class Application < Sinatra::Base
    include UserHelper
    register Sinatra::Flash
    register Sinatra::Partial

    use Routes::App
    use Routes::HomePage
    use Routes::UserSession
    use Routes::Peeps

  end

end
