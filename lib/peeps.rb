class Peep
  attr_accessor :id, :content, :created_at, :username, :user_id

  def initialize(id:, content:, created_at:, username:, user_id:)
    @id = id
    @content = content
    @created_at = created_at
    @username = username
    @user_id = user_id
  end
end