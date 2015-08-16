module ChitterModule

  module Routes

    class HomeController < Base

      get '/' do
        redirect to('/peeps')
      end

    end

  end

end
