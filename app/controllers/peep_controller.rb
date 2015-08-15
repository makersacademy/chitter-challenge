module ChitterApp
  module Routes
    class PeepController < Base
      get '/peeps' do
        @peeps = Peep.all
        erb :'/peeps/index'
      end

      post '/peeps' do
        Peep.create(text: params[:peep])
        redirect '/peeps'
      end

      get '/peeps/new' do
        erb :'/peeps/new'
      end
    end
  end
end
