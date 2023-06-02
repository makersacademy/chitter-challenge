require 'pg'

class PeepRepository
  def self.create(peep)
    # Database insert query to create a new peep record
  end

  def self.find_all
    # Database query to retrieve all peeps in reverse chronological order
  end

  def self.find_by_user(user_id)
    # Database query to find all peeps by a specific user
  end
end