module Chitter
  module Routes
    class Peeps < Base

      get '/' do
        redirect('/peeps')
      end

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/index'
      end

      get '/peeps/new' do
        unless current_user
          flash[:message] = 'Sign in or sign up to peep!'
          redirect to('/peeps')
        else
          erb :'peeps/new'
        end
      end

      post '/peeps/new' do
        peep = Peep.create(peep: params[:peep], user: current_user)
        if peep.save
          redirect to('/peeps')
        # else
        #   flash.now[:errors] = peep.errors.full_messages
        #   erb :'peeps'
        end
      end

    end
  end
end
