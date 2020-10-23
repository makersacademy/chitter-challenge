class Peep
  attr_reader :id, :message, :username, :created_at

  def initialize(id, message, username, created_at)
    @id = id
    @message = message
    @username = username
    @created_at = DateTime.parse(created_at)
  end
end
