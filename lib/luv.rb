class Luv < ActiveRecord::Base
  belongs_to :peep
  
  def self.all_for target
    Luv.where(peep_id: target.id).count
  end
end
