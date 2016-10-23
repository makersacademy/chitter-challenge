class Peep
  include DataMapper::Resource

  property :id,                Serial
  property :content,           Text
  property :created_at,        DateTime

  belongs_to :user

  def self.new_line(content)
    content.gsub(/\n/, "<br>")
  end

end
