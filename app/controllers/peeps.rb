module ChitterModule

  module Routes

    class PeepController < Base

      get '/peeps' do
        @peeps = Peep.all(order: [:time.desc])
        erb :'peeps/index'
      end

      post '/peep' do
        Peep.create(body: params[:peep_body],
                    user_id: session[:user_id],
                    time: Time.now)
        redirect to('/peeps')
      end

    end

  end

end