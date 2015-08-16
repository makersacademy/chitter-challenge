module Armadillo
  module Routes
    class PeepController < Base

      get "/peeps/new" do
        if current_user
          erb :'peeps/new'
        else
          flash[:notice] = "You must be logged in to peep"
          redirect '/'
        end
      end
    end
  end
end