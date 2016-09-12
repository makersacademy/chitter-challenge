require           'data_mapper'
require           'dm-postgres-adapter'
require           'dm-validations'
require_relative  'user'

class Peep

  include DataMapper::Resource

  property :id,                  Serial
  property :content,             Text
  property :created_at,          Time

  has 1, :user, through: Resource

  def get_time
    if Time.now.day == created_at.day
      "Today, " + created_at.strftime("%H:%M")
    else
      created_at.strftime("%A, %b %d, %H:%M")
    end
  end

end
