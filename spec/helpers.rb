module Helpers

  def sign_up
    visit('/register/signup')
    fill_in :username, with: 'CleoP'
    fill_in :email, with: 'cleo@email.com'
    fill_in :password, with: 'password1'
    click_button "sign-up"
  end

  def sign_up_wrong_email
    visit('/register/signup')
    fill_in :username, with: 'CleoP'
    fill_in :email, with: 'abcdefgh'
    fill_in :password, with: 'password1'
    click_button "sign-up"
  end

  def peep_helper
    fill_in :peep, with: 'My first peep!'
    click_button 'peep'
  end

  def peep_helper_2
    fill_in :peep, with: 'My second peep!'
    click_button 'peep'
  end


end
