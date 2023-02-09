class Peep < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :likes
end
