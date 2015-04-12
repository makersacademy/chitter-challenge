module MessageHelpers

  def click_mail
    find(".mail").click
  end

  def send_mail
    click_mail
    click_link "Send Message"
    select "john89", from: "reciver"
    fill_in "title", with: "Title"
    fill_in "text", with: "Text"
    click_button 'Send'
  end

  def log_in_follow_peep_log_out
    log_in("john89", "password")
    follow
    peep("this is a peep")
    click_link "Log out"
  end

  def two_users_signs_and_one_send_mail
    sign_up
    peep_log_out
    john_signs_up
    log_in_follow_peep_log_out
    log_in("bob89", "password")
    follow
    send_mail
    click_link "Log out"
  end

end