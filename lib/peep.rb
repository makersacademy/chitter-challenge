class Peep
  attr_reader :id, :message, :author_id, :created_at

  def initialize(id, message, author_id, created_at)
    @id = id
    @message = message
    @author_id = author_id
    @created_at = Time.at(created_at).utc.to_datetime
  end
end
