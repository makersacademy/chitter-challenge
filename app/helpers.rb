module Helpers
  def get_user_by_id(user_id)
    User.first(id: user_id)
  end
end
