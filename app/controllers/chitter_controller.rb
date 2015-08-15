module ChitterApp
  module Routes
    class ChitterController < Base
      get '/chitters' do
        @chitters = Chitter.all
        erb :'/chitters/index'
      end

      post '/chitters' do
        Chitter.create(text: params[:chit])
        redirect '/chitters'
      end

      get '/chitters/new' do
        erb :'/chitters/new'
      end
    end
  end
end
