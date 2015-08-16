require_relative './base'
module Bamboo
  module Routes
    class PeepController < Base
      get '/peeps' do
        @peeps = Peep.all
        erb :'/peeps/new'
      end

      post '/peeps' do
        message = params[:message]
        user_id = session[:user_id]
        Peep.create(handle:current_user.handle,
                    message: message,
                    time: current_time,
                    user_id: user_id)
        redirect to('/peeps')
      end
    end
  end
end
