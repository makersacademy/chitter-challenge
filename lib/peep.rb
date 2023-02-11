class Peep
  attr_accessor :id, :title, :username, :content, :created, :maker_id
  
  def initialize(id:, date:, time:, message:, sender:)

    @id = id
    @title = title
    @username = username
    @content = content
    @created = created
    @maker_id = maker_id

  end
end