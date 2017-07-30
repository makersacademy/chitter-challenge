class Notification
  CHITTER_EMAIL = "notify@chitter.com"
  DEFAULT_SUBJECT = "Someone tagged you in a peep!"
  DEFAULT_BODY = "peeped about you!"

  def initialize(tagged_user, tagging_user)
    @tagged_user = tagged_user
    @tagging_user = tagging_user
  end

  def self.send(tagged_user, tagging_user)
    new(tagged_user, tagging_user).compose(tagged_user.email, tagging_user.username).deliver
  end

  def compose(recipient, tagger)
    Mail.new do
      from    CHITTER_EMAIL
      to      recipient
      subject DEFAULT_SUBJECT
      body    "@#{tagger} #{DEFAULT_BODY}"
    end
  end

  private
  attr_reader :tagged_user, :tagging_user

end
