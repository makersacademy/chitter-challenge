require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id,           Serial
  property :text,         String
  property :created_at,   DateTime
  belongs_to :user
  belongs_to :peep, :required => false

  def format_created_at
    @created_at.strftime("#{@created_at.day.ordinalize} of %B, %Y at %-l:%M%P")
  end
end
