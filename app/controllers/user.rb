require_relative 'base'

module Application
  module Routes
    class XUser < Base
      get '/users/new' do
        erb :'/users/new'
      end

    end
  end
end

