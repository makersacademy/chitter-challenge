module Chitter
  module Routes
    class Sessions < Base
      get '/sessions/new' do
        erb :'sessions/new'
      end

      post '/sessions' do
        redirect '/'
      end
    end
  end
end
