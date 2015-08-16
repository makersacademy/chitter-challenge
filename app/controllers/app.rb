require_relative './base'

module Bamboo
  module Routes
    class AppController < Base
      get '/' do
        erb :index
      end
    end
  end
end
