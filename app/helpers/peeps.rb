require 'sinatra/base'

module Sinatra
  module Peeps

    def print(peep)
      words = peep.body.split().map do |word|
        if word.include?('@')
          chars = word.split(/[^a-zA-Z0-9_]/)
          "<a class='text-secondary' href='/#{chars[1]}'>#{word}</a>"
        else
          word
        end
      end

      words.join(" ")
    end

  end
  helpers Peeps
end
