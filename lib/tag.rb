require 'active_record'

class Tag < ActiveRecord::Base
  belongs_to :peep
  belongs_to :user

end
