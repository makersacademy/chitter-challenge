module Helpers
  def current_user
    User.get session[:current_id]
  end

  def first_name(name)
    name.split(' ')[0]
  end
end
