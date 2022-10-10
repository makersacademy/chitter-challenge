class Peep
  attr_accessor :timestamp, :content, :maker_id

  def initialize(timestamp, content, maker_id)
    @timestamp = timestamp
    @content = content
    @user_id = maker_id
  end
end
