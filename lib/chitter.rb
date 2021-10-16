require 'pg'

class Chitter

  def self.create
    @chitter = Chitter.new
  end

  def self.instance
    @chitter
  end
  
end