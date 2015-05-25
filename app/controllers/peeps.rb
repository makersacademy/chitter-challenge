module Chitter

  module Routes

    class Peeps < Base

      get '/' do
        erb :index
      end

      post '/peeps' do
        message = params['message']
        user_id = session[:user_id]
        time = Time.now
        Peep.create(message: message, time: time, user_id: user_id)
        redirect to('/')
      end

      get '/peeps/new' do
        erb :"peeps/new"
      end

    end

  end

end

