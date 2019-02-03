class WebHelper

  def self.sign_up
    visit('/')
    find(:button, "Sign-up").click
    fill_in("new_user_name", with: "mike_tyson")
    fill_in("new_user_password", with: "boxing")
    find(:button, "Submit Details").click
  end

  def self.sign_in
    visit('/')
    fill_in("user_name", with: "mike_tyson")
    fill_in("password", with: "boxing")
    find(:button, "Log-in").click
  end

  def self.submit_message
    self.sign_in
    fill_in("Chitter", with: "This is a message!")
    find(:button, "Post Chitter").click
  end

  def self.view_all_chitters
    self.sign_in
    self.submit_message
    find(:xpath, "//a[@href='/all-chitters']").click
  end

end
