module PeepHelpers

  def login_and_peep_chitter1(peep = "My first peep, hurray!")
    sign_up
    click_button "Log out"
    log_in
    fill_in :peepbox, with: peep
    click_button "Peep"
  end

  def login_and_peep_chitter2(peep = "Another peep")
    sign_up(username: "chitter2",
            email: "chitter2@testdomain.com")
    click_button "Log out"
    log_in(email: "chitter2@testdomain.com")
    fill_in :peepbox, with: peep
    click_button "Peep"
  end

end
