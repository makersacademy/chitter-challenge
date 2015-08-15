module Chitter

  module Routes

    class Peeps < Base

      get '/peeps/new' do
        erb :'peeps/new'
      end

      post '/peeps' do
        peep = Peep.create(peep: params[:peep])
        peep.save
        redirect('/')
      end

    end

  end

end
