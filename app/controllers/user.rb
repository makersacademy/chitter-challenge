require_relative 'base'

module Application
  module Routes
    class XUser < Base
      get '/users/new' do
        erb :'/users/new'
      end

      post '/users' do
        redirect '/users/new' if params[:password] == "" || params[:email] == ""
      end

    end
  end
end

