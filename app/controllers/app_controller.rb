module Chitter

  module Routes

    class App < Sinatra::Base
      include UserHelper

      run! if app_file == $PROGRAM_NAME

      use Rack::MethodOverride

      register Sinatra::Flash
      register Sinatra::Partial

      set :partial_template_engine, :erb
      enable :partial_underscores

      set :views, proc { File.join(root, '..', 'views') }

      enable :sessions
      set :session_secret, 'super secret'
    end

  end

end
