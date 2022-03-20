require 'date'

class Peep
  attr_reader :id, :content, :maker_id, :created
  
  def initialize(id, content, maker_id, created)
    @id = id
    @content = content
    @maker_id = maker_id
    @created = creation_timestamp(created)
  end

  def format_time
    @created.strftime("%k:%M")
  end

  private
  
  def creation_timestamp(created)
    @created = created.nil? ? DateTime.now : DateTime.parse(created)
  end
end
