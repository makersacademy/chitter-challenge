module Chitter

  module Routes

    class Peeps < Sinatra::Base

      post '/peeps' do
        peep = Peep.create(peep: params[:peep])
        peep.user = current_user
        peep.save
        redirect '/'
      end

    end

  end

end
