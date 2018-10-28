class Peep
  attr_reader :id, :text, :user_id, :date

  def initialize(id:, text:, user_id:, date:)
    @id = id
    @text = text
    @user_id = user_id
    @date = date
  end

  def self.create(text:, user_id:)
    Peep.new(id: 1, text: text, user_id: user_id, date: Time.now)
  end

end
