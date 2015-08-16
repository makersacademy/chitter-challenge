require_relative './base'

module Bamboo
  module Routes
    class AppController < Base
      get '/' do
        erb :'/peeps/index'
      end
    end
  end
end
