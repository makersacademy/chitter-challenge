def signup
    visit('/')
    click_button('Sign Up')
    visit('/users/new')
    fill_in('username', with: 'Hagrid')
    fill_in('email', with: 'hagrid@gmail.com')
    fill_in('password', with: 'hagrid123')    
    click_button('Sign Up')
  end
  
  def login
    visit('/sessions/new')
    fill_in('email', with: 'notrightmail@mail.com')
    fill_in('password', with: 'hagrid123')
    click_button('Log In')
  end