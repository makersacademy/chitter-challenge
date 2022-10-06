class peep
def initialize(content, creation_date, user_id)
  @content = content
  @creation_date = creation_date
  @user_id = user_id
end

  attr_accessor :content, :creation_date, :user_id
end