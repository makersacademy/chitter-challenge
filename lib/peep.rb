class Peep
  attr_reader :id, :content, :posted_at, :user_id

  def initialize(id, content, posted_at, user_id)
    @id = id
    @content = content
    @posted_at = posted_at
    @user_id = user_id
  end
end