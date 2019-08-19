class PeepUserTag < ActiveRecord::Base
  belongs_to :user
  belongs_to :peep
end
