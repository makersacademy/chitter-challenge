module Armadillo
  module Routes
    class PeepController < Base

      get "/peeps/new" do
        erb :'peeps/new'
      end
    end
  end
end