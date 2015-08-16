module Chitter

  module Routes

    class Peeps < Base

      get '/peeps/new' do
        unless current_user
          flash[:notice] = 'Please sign up or sign in first!'
          redirect('/')
        end
        erb :'peeps/new'
      end

      post '/peeps' do
        current_user
        peep = Peep.create(peep: params[:peep])
        @current_user.peeps << peep
        @current_user.save
        redirect('/')
      end

    end

  end

end
