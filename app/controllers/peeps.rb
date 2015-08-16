module ChitterModule
  module Routes

    class PeepController < Base

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/index'
      end

      post '/peep' do
        Peep.create(body: params[:peep_body])
        redirect to('/peeps')
      end
    end
  end
end