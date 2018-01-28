module Helpers

  def sign_up(username:'CleoP', email:'cleo@email.com', password:'password1')
    visit('/register/signup')
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Sign up"
  end

  def sign_up_same_username
    visit('/register/signup')
    fill_in :username, with: 'CleoP'
    fill_in :email, with: 'cleo@gmail.com'
    fill_in :password, with: 'password1'
    click_button "Sign up"
  end

  def sign_up_wrong_email
    visit('/register/signup')
    fill_in :username, with: 'CleoP'
    fill_in :email, with: 'abcdefgh'
    fill_in :password, with: 'password1'
    click_button "Sign up"
  end

  def sign_in(email:'cleo@email.com', password:'password1')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
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
