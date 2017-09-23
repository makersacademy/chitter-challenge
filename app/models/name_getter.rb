require_relative 'user'

class NameGetter
  def latest_signup
      User.all.last.real_name
  end
end
