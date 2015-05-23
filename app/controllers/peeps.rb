module Chitter
  module Routes
    class Peeps < Base

      get '/' do 
        @peeps = Peep.all
        erb :index
      end

      post '/peeps' do
        message = params['message']
        Peep.create(message: message)
        redirect to('/')
      end

      get '/peeps/new' do 
        erb :"peeps/new"
      end

    end
  end
end