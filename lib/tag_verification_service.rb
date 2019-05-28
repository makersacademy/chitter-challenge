require './lib/tag'
require './lib/message_service'

class TagService 

  def self.check(peep:)
    Tag.find_content(content: peep)
  end
  
end
