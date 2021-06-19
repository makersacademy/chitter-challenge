require 'pg'

class Chitter
  def self.create(id:, message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING id, message")
    Peep.new(
      id: result[0]['id'],
      message: result[0]['message']
    )
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map do |peep|
    Peep.new(
      id: peep['id'],
      message: peep['message']
    )
  end
end


  attr_reader :id, :message

end