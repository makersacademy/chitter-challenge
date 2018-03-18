class Validate

  def self.email(email)
    email.include? '@'
  end
end
