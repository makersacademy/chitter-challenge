class Peep
  attr_accessor :id, :content, :user_id, :created_at

  def initialize(id:, content:, user_id:, created_at:)
    @id = id
    @content = content
    @user_id = user_id
    @created_at = created_at
  end
end