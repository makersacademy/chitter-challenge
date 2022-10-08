class Peep < ActiveRecord::Base
  belongs_to :user 
  # validates :content
end