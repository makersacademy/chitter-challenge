require_relative './base.rb'

module Turing
  module Routes
    class AppRoute < Base
      
    get '/' do
      "Welcome to Chitter"
    end

    end
  end
end