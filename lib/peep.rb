class Peep < ActiveRecord::Base
  validates_length_of :text, maximum: 280
end
