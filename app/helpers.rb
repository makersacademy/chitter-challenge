require 'active_support/core_ext/time'

module Helpers
  def get_user_by_id(user_id)
    User.first(id: user_id)
  end

  def pretty_date(timestamp)
    time_plus_one = timestamp + 3600
    time_plus_one.strftime("%a %d %B %H:%M")
  end
end
