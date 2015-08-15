module Chitter
  module Routes
    class Base < Sinatra::Base
      include AppHelpers

      set :views, proc { File.join(root, '..', 'views') }
      enable :sessions
      set :session_secret, 'secret'
    end
  end
end
