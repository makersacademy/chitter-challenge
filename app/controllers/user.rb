module ChitterModule
  module Routes

    class UserController < Base

      get '/users/new' do
        erb :'users/new'
      end
    end
  end
end