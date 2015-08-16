module TheApp

  module Routes

    class HomeController < Base
      get '/' do
        if current_user
          redirect to '/peeps'
        else
          erb :index
        end
      end
    end

  end

end