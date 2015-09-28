module ChitterApp
  module Routes
    class Base < Sinatra::Base
      include Helper

      set :views, proc {File.join(root, '..', 'views')}

      enable :sessions
      set :session_secret, 'super secret'
      register Sinatra::Flash
      use Rack::MethodOverride

    end
  end
end
