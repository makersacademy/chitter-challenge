class Reply < Message 

  def initialize(id:, message:, create_date:, username:, message_id:)
    @message_id = message_id
    super(id: id, message:message, create_date:create_date, username: username)
  end

end