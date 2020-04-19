require 'sinatra/base'

module Sinatra
  module Formatting

    def print_with_tags(peep)
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

    def date_and_time(created_at)
      created_at.strftime("%e %b %Y %k:%M")
    end

  end
  helpers Formatting
end
