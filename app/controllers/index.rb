module Chitter
  module Routes
    class Mainpage < Base
      get '/' do
        erb :index
      end
    end
  end
end
