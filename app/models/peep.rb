class Peep

  ALL_PEEPS = []
  attr_reader :username, :status

  def initialize(username, status)
    @username = username
    @status = status
    ALL_PEEPS << self
  end

  def self.all
    ALL_PEEPS
  end
end
