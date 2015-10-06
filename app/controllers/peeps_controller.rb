module Chitter

  module Routes

    class Peeps < App

      # Creating Peeeps
      post '/peeps' do
        peep = Peep.create(peep: params[:peep])
        peep.user = current_user
        peep.save
        redirect '/'
      end

    end

  end

end
