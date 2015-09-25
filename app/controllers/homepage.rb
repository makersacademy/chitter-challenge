module Chitter
  module Routes
    class Homepage < Base
      get '/' do
        redirect('/peeps')
      end
    end
  end
end