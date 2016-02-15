  def sign_up(name='Emma', username='chitterer', email='myemail@email.com', password='bestpasswordever', password_confirmation='bestpasswordever')
    visit '/'
    click_button 'Sign Up'
    fill_in('name', with: name)
    fill_in('username', with: username)
    fill_in('email', with: email)
    fill_in('password', with: password)
    fill_in('password_confirmation', with: password_confirmation)
    click_button('Submit')
  end

  def signin(username='chitterer', password='bestpasswordever')
    visit '/'
    click_button 'Sign In'
    fill_in('username', with: username)
    fill_in('password', with: password)
    click_button('Submit')
  end

  def create_peep(peep)
    visit '/'
    click_button('Create Peep')
    fill_in('peep', with: peep)
    click_button 'Submit'
  end
