module Chitter

  module Routes

    class Mainpage < Base

      get '/' do
        @peeps = Peep.all
        erb :index
      end

    end

  end

end
