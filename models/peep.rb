class Peep < ActiveRecord::Base
  belongs_to :maker

  def self.write(content, maker)
    create(content: content, maker_id: maker)
  end
end
