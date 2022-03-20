class Peep
  attr_reader :id, :content, :maker_id, :created
  
  def initialize(id, content, maker_id, created)
    @id = id
    @content = content
    @maker_id = maker_id
    @created = created
  end
end
