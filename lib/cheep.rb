class Cheep

  attr_reader :handle, :name, :message, :time

  def initialize(handle, name, message)
    @handle = handle
    @name = name
    @message = message
    @time = Time.now
  end

end
