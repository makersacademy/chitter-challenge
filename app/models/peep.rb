class Peep < ActiveRecord::Base
  belongs_to :user 
  
  validates :content, 
  presence: true,
  length: { maximum: 280 }
  
end