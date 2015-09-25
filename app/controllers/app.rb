require_relative './base.rb'

module Turing
  module Routes
    class AppRoute < Base
      
    get '/' do
      erb :index
    end

    end
  end
end