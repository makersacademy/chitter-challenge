module ChitterApp
  module Routes
    class UserController < Base
      get '/user' do
        erb :test
      end
    end
  end
end
