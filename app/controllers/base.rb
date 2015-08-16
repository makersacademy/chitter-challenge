module ChitterModule
  module Routes
    class Base < Sinatra::Base

      include AppHelpers

      enable :sessions
      set :session_secret, 'super secret'

      use Rack::MethodOverride
      register Sinatra::Flash

      set :views, proc { File.join(root,'../..','views') }
      set :public_folder, proc { File.join(root, '../..', 'public') }

    end
  end
end