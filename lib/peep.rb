require 'active_record'

class Peep < ActiveRecord::Base
  def formatted_created_at
    self[:created_at].strftime(
      '%e %b %Y %H:%M:%S%p'
    )
  end

  def self.all_reverse_chrono
  end
end