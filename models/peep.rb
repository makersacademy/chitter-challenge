class Peep < ActiveRecord::Base
  validates_presence_of :message, :user_id

  belongs_to :user
end
