module Chitter
  module Routes
    class Homepage < Base
      get '/' do
        erb :'peeps/content'
      end
    end
  end
end