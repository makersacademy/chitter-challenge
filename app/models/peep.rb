class Peep < ActiveRecord::Base
  def self.parents
    p_peeps = Peep.where(parent_id: nil).map { |peep| peep }
    return nil if p_peeps.length.positive?

    p_peeps
  end
  
  def user
    user_class.find_by(id: user_id)
  end
  
  def replies
    r_peeps = Peep.where(parent_id: id).map { |peep| peep }
    return nil if r_peeps.length.zero?

    r_peeps
  end

  private

  def user_class
    User
  end
end
