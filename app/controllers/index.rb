module Armadillo
  module Routes

    class Homepage < Base
      get '/' do
        erb :index
      end
    end

  end
end