module Helpers

  def sign_up
    visit('/register/signup')
    fill_in :email, with: 'cleo@email.com'
    fill_in :password, with: 'password1'
    click_button "sign-up"
  end

  def multiple_peeps_helper
    fill_in :peep, with: 'I love sql'
    fill_in :peep, with: 'I am feeling happy'
    fill_in :peep, with: 'Coding rocks'
    fill_in :peep, with: 'Raining outside'
    click_button 'peep'
  end

end
