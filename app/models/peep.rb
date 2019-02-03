require 'active_record'

class Peep < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :message

  def self.find_username(peep)
    output = peep.match('@(\w+)')
    return false if output == nil
    output[1]
  end
end
