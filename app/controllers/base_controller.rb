module ChitterApp
  module Routes
    class Base < Sinatra::Base
      include CurrentUser
      set :views, proc {File.join(root, '..', 'views')}
      enable :sessions
      register Sinatra::Flash
      use Rack::MethodOverride
      set :session_secret, 'super secret'
    end
  end
end
