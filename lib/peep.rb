# frozen_string_literal: true

# this is the peep class
class Peep
  attr_reader :id, :text
  
  def initialize(id:, text:)
    @text = text
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('#{text}') RETURNING id, text;")
    Peep.new(id: result[0]['id'], text: result[0]['text'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")
    result.map do |peep|
      Peep.new(
        text: peep['text'],
        id: peep['id']
      )
    end
  end
end
