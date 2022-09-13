class Peeps < ActiveRecord::Base
  validates :content, presence: { strict: true }
end

