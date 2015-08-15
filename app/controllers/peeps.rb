module Chitter
  module Routes
    class Peeps < Base

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/content'
      end

      post '/peeps' do
        if current_user
          peep = Peep.create(content: params[:peep])
          peep.users << current_user
          peep.save
          current_user.peeps << peep
        else
          flash[:notice] = 'Please sign up or login first!'
        end
        redirect('/')
      end

      get '/peeps/new' do
        erb :'peeps/new'
      end

    end
  end
end