require './app/helpers/app_helpers'

module Contro

  module Routes

    class Base < Sinatra::Base
      enable :sessions
      set :session_secret,'super secret'
      include AppHelpers
      set :views, proc { File.join(root, '..', 'views') }
    end
  end

end
