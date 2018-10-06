class Peep < ActiveRecord::Base
  validates :peep, length: { maximum: 240 }
end
