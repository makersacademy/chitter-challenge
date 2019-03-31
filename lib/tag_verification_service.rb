require './lib/tag'

class TagService 

  def self.check(peep:)
    Tag.find_content(content: peep) ? "We have a match" : "No match"
  end
  
end