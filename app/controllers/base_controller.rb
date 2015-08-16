module TheApp

  module Routes

    class Base < Sinatra::Base

      include AppHelpers
      enable :sessions
      set :session_secret, 'super secret'
      set :views, proc { File.join(root, '..', 'views') }
      set :partial_template_engine, :erb
      register Sinatra::Flash
      register Sinatra::Partial
      use Rack::MethodOverride

      run! if app_file == $0

    end

  end

end