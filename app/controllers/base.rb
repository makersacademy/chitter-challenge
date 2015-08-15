module Chitter
  module Routes
    class Base < Sinatra::Base
      enable :sessions
      # register Sinatra::Flash
      set :session_secret, 'super secret'
      set :views, proc { File.join(root, '..', 'views') }
      # set :public_folder, proc { File.join(root, '../..', 'public') }
      use Rack::MethodOverride
      include ApplicationHelpers

      configure do
        register Sinatra::Partial
        set :partial_template_engine, :erb
      end
    end
  end
end