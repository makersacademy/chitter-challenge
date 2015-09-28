module Chitter
  module Routes
    class Base < Sinatra::Base
      helpers UserHelpers
      register Sinatra::Flash
      use Rack::MethodOverride
      enable :sessions
      set :session_secret, 'super secret'
    end
  end
end
