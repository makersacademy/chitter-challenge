class Message

  def self.list(list = ["Hello", "How are you"])
    @messages = list
  end

  def self.all
    @messages
  end

  def self.post(text:)
    list
    @messages << text
  end

end
