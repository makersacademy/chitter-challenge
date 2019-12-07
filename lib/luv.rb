class Luv < ActiveRecord::Base
  def self.all_for target
    Luv.where(peep_id: target.id).count
  end
end
