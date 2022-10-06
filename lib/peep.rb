class peep
def initialize(content = '', creation_date = 0, user_id = 0)
  @content = content
  @creation_date = creation_date
  @user_id = user_id
end

  attr_accessor :content, :creation_date, :user_id
end