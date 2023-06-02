equire 'pg'

class PeepTagRepository
  def self.create(peep_tag)
    # Database insert query to create a new peep_tag record
  end

  def self.find_by_peep(peep_id)
    # Database query to find all tags for a specific peep
  end

  def self.find_by_tag(tag_id)
    # Database query to find all peeps for a specific tag
  end
end