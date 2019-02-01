class WebHelper

  def self.sign_in
    visit('/')
  end

  def self.submit_message
    self.sign_in
    fill_in("Messages", with: "This is a message!")
    find(:button, "Submit Message").click
  end
end
