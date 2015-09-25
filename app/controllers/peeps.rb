require './app/helpers/app_helpers'

module Contro
    module Routes
      class PeepController < Base

      post '/peeps' do
        @peep = Peep.create(content: params[:peep])
        redirect'/peeps'
      end

      get '/peeps' do
        @list = Peep.all
        erb :'peep/index'
      end

       end
    end
end