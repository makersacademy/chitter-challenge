class Peep
  attr_reader :text, :user, :handle

  def initialize(text:, name:, handle:)
    @text = text
    @user = user
    @handle = handle
  end

  def self.create(text:, name:, handle:)
    
  end
end