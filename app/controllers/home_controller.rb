module Armadillo
  module Routes
    class HomeController < Base

      get '/' do
        @peeps = Peep.all
        erb :index
      end

      post '/' do
        user = current_user
        peep = Peep.new(content: params[:content], timestamp: ((Time.now).strftime("at %I:%M%p on %e/%m/%y")))
        peep.save
        user.peeps << peep
        user.save
        redirect '/'

      end
    end
  end
end