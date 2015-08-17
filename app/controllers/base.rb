module Chitter

  module Routes

    class Base < Sinatra::Base

      include AppHelpers

      set :views, proc { File.join(root, '..', 'views') }
      set :public_folder, proc { File.join(root, '../..', 'public') }
      enable :sessions
      set :session_secret, 'secret'
      register Sinatra::Flash
      use Rack::MethodOverride

      configure do
        register Sinatra::Partial
        set :partial_template_engine, :erb
      end

    end

  end

end
