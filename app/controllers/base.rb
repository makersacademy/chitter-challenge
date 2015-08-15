module ChitterModule
  module Routes
    class Base < Sinatra::Base

      include AppHelpers

      enable :sessions
      set :session_secret, 'super secret'

      set :views, proc { File.join(root,'../..','views') }

    end
  end
end