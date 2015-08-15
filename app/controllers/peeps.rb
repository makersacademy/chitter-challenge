module ChitterModule
  module Routes

    class PeepController < Base

      get '/peeps' do
        erb :'peeps/index'
      end
    end
  end
end