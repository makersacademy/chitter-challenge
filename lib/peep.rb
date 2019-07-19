# frozen_string_literal: true

# this is the peep class
class Peep
  attr_reader :text
  
  def initialize(text:)
    @text = text
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        text: peep['text'],
      )
    end
  end

  def self.create(text:)
  end
end
