class Peep

  attr_reader :email, :text, :dt

  def initialize(text, email, dt)
    @text = text
    @email = email
    @dt = dt
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['text'], peep['email'], peep['dt'])}
  end

end
