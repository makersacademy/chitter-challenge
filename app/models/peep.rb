class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :post_text,   Text
  property :created_at, DateTime

  def formatted_date
    self.created_at.strftime("%Y-%m-%d at %H:%M")
  end
end
