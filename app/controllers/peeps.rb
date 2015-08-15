module Chitter
  module Routes
    class Peeps < Base

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/content'
      end

      post '/peeps' do
        peep = params[:peep]
        current_user.peeps << Peep.create(content: peep)
        redirect('/')
      end

      get '/peeps/new' do
        erb :'peeps/new'
      end

    end
  end
end