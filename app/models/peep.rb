require 'active_record'

class Peep < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :message
end
