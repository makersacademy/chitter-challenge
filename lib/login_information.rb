class LoginInformation
  def self.authenticate email_entry, password_entry
    target = User.where(email: email_entry).first
    return false unless target

    target.email == email_entry && target.password == password_entry
  end
end
