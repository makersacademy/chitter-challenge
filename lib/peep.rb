require 'active_record'
require 'pg'

class Peep < ActiveRecord::Base
  validates :message, presence: true

  def self.tag?(peep)
    message = peep.message
    match = message.match(/[@](\w*)/)
    match&.captures&.first
  end

end
