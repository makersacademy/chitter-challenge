require 'pg'

class Peep
  attr_reader :message

  def initialize(options)
    @message = options[:message]
  end
end
