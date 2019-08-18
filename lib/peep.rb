class Peep
  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    peeps = result.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        created_at: Time.parse(peep['created_at'])
      )
    end
    peeps.sort_by { |peep| -peep.id.to_i }
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT into peeps (message) VALUES('#{message}') RETURNING id, message, created_at")
    Peep.new(
      id: result[0]['id'],
      message: result[0]['message'],
      created_at: result[0]['created_at']
    )
  end




  attr_reader :id, :message, :created_at

  def initialize(id:, message:, created_at:)
    @id = id
    @message = message
    @created_at = created_at
  end

  def datetime
    @created_at.strftime("%b %e, %l:%M %p")
  end
end