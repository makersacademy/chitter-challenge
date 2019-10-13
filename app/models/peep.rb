class Peep < ActiveRecord::Base
  def user
    user_class.find_by(id: user_id)
  end

  private

  def user_class
    User
  end
end