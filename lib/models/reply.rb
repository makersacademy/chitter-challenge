class Reply
  attr_accessor :id, :content, :timestamp, :user_id, :peep_id

  def initialize(id:, content:, timestamp:, user_id:, peep_id:)
    @id = id
    @content = content
    @timestamp = timestamp
    @user_id = user_id
    @peep_id = peep_id
  end
end