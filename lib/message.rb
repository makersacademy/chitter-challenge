class Message

  def initialize(id:, message:, create_date:)
    @id = id
    @message = message
    @create_date = create_date
  end

  attr_reader :id, :message, :create_date
end