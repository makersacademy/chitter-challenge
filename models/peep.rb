require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, String
  property :created_at, DateTime
  property :created_by, Integer # => foreign key

  def self.sort_by_date_created(peeps)
    peeps.sort_by { |peep| peep.created_at }.reverse
  end

  def created_at_time
    @created_at.strftime('%H:%M')
  end

  def created_at_date
    @created_at.strftime('%d/%m/%Y')
  end

  def creator_name
    created_by.nil? ? 'Unknown' : User.get(created_by).user_name
  end
end
