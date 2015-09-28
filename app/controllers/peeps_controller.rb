module Chitter

  module Routes

    class Peeps < Sinatra::Base

      post '/peeps' do
        peep = Peep.create(peep: params[:peep])
        peep.user = current_user
        peep.save
        redirect '/peeps'
      end

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/index'
      end

      get '/peeps/new' do
        erb :'/peeps/new'
      end

    end

  end

end
