class Like < ActiveRecord::Base
  def self.all_for target
    Like.where(peep_id: target.id).count
  end
end
