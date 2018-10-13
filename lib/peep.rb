class Peep < ActiveRecord::Base
  belongs_to :user
  validates :peep, length: { maximum: 240 }
end
