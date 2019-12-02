require 'pg'

class Peep

  attr_reader :content, :author_name, :author_handle, :peep_content

  def initialize(content, author_name = "Marianne", author_handle = "marianneoco")
    @content = content
    @author_name = author_name
    @author_handle = author_handle
  end

  def self.create(content
    @peep_content = content
  end

  def self.all

  end

end
