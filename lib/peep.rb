class Peep
  attr_reader :time, :message

  def initialize(time:, message:)
    @time = time
    @message = message
  end
end