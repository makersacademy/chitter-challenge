module Armadillo
  module Routes
    class Base < Sinatra::Base
      register Sinatra::Flash
      use Rack::MethodOverride
      set :views, proc { File.join(root, '..', 'views') }

      helpers do
      def current_user
        User.get(session[:user_id])
      end
    end
    end
  end
end