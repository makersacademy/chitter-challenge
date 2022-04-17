class Peep < ActiveRecord::Base
  validates :description, presence: true
end
