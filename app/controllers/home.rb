module ChitterModule
  module Routes

    class HomeController < Base

      get '/' do
        'Hello Chitter!'
      end
    end
  end
end
