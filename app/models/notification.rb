class Notification
  CHITTER_EMAIL = "notify@chitter.com"
  DEFAULT_SUBJECT = "Someone tagged you in a peep!"
  DEFAULT_BODY = "peeped about you!"

  def self.send(tagged_user, tagging_user)
    new.compose(tagged_user.email, tagging_user.username).deliver
  end

  def compose(recipient, tagger)
    Mail.new do
      from    CHITTER_EMAIL
      to      recipient
      subject DEFAULT_SUBJECT
      body    "@#{tagger} #{DEFAULT_BODY}"
    end
  end
end
