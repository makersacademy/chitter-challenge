require_relative 'base'

module Application
  module Routes
    class Posts < Base

      get '/posts/new' do
        erb :'/posts/new'
      end

    end
  end
end
