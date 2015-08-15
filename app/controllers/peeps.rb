module Chitter
  module Routes
    class Peeps < Base

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/content'
      end

      post '/peeps' do
        peep = Peep.create(content: params[:peep])
        peep.users << current_user
        peep.save
        current_user.peeps << peep
        redirect('/')
      end

      get '/peeps/new' do
        erb :'peeps/new'
      end

    end
  end
end