class Peep < ActiveRecord::Base
  validates :content, presence: { strict: true }
  belongs_to :user
end

