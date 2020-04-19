require 'sinatra/base'

module Sinatra
  module Errors
    def error_not_unique(field)
      "Sorry, #{field} already taken. Please try again"
    end


  end

  helpers Errors
end
