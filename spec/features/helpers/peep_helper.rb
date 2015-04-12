module PeepHelpers

  def peep(text)
    fill_in :peep, with: text
    click_button 'Peep'
  end

  def peep_log_out
    sign_up
    log_in("bob89", "password")
    peep("this is a peep")
    click_link "Log out"
  end

  def comment(text)
    fill_in :text, with: text
    click_button 'Insert comment'
  end

end