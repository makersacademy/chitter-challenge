require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id,           Serial
  property :content,      String, :lazy => false
  property :created_at,   DateTime

  belongs_to :user

  def time
    p " iegfuewohfo"
    p created_at
    created_at.strftime("%H:%M:%S - %d/%m/%y")
  end

end
