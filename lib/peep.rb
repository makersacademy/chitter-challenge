require 'pg'

class Peep

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end
end