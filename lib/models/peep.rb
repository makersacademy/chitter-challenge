class Peep
  attr_accessor :id, :content, :timestamp, :user_id

  def initialize(id:, content:, timestamp:, user_id:)
    @id = id
    @content = content
    @timestamp = timestamp
    @user_id = user_id
  end
end