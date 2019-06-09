  def peep
    visit('/')
    fill_in 'content', with: 'Hello World'
    click_button 'Peep!'
    # visit('/')
  end
  
  def peep_again
    visit('/')
    fill_in 'content', with: 'Hello Again World'
    click_button 'Peep!'
    # visit('/')
  end
  
  def sign_up
    visit('/')
    click_button 'Sign Up!'
    fill_in 'email', with: 'email_address_1@gmail.com'
    fill_in 'password', with: 'password12345'
    fill_in 'name', with: 'name_1'
    fill_in 'username', with: 'username_1'
    click_button 'Sign Up!'
  end