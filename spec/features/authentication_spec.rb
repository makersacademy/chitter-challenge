feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'example@lycos.com', password: 'realpassword')

    visit '/sessions/new'
    fill_in(:email, with: 'example@lycos.com')
    fill_in(:password, with: 'realpassword')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, example@lycos.com'
  end

  feature 'authentication' do
    scenario 'a user sees an error if they get their email wrong' do
      User.create(email: 'example@lycos.com', password: 'realpassword')
  
      visit '/sessions/new'
      fill_in(:email, with: 'nottherightemail@lycos.com')
      fill_in(:password, with: 'realpassword')
      click_button('Sign in')
  
      expect(page).not_to have_content 'Welcome, example@lycos.com'
      expect(page).to have_content 'Please check your email or password.'
    end

    scenario 'a user sees an error if they get their password wrong' do
      User.create(email: 'example@lycos.com', password: 'realpassword')
  
      visit '/sessions/new'
      fill_in(:email, with: 'example@lycos.com')
      fill_in(:password, with: 'fakepassword')
      click_button('Sign in')
  
      expect(page).not_to have_content 'Welcome, example@lycos.com'
      expect(page).to have_content 'Please check your email or password.'
    end

    scenario 'a user can sign out' do
      User.create(email: 'example@lycos.com', password: 'realpassword')
  
      visit '/sessions/new'
      fill_in(:email, with: 'example@lycos.com')
      fill_in(:password, with: 'realpassword')
      click_button('Sign in')
  
      click_button('Sign out')
  
      expect(page).not_to have_content 'Welcome, test@example.com'
      expect(page).to have_content 'You have signed out.'
    end
  end
end