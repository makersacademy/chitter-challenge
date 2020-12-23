feature 'registration' do
  scenario 'a maker can sign up' do
    visit '/peeps'
    click_button("Sign up")
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'rubberduck')
    click_button('Submit')

    expect(page).to have_content "Welcome, rubberduck"
  end

  scenario 'if username/email are already in use user get info to try again' do

    visit '/peeps'
    click_button("Sign up")
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'rubberduck')
    click_button('Submit')

    click_button('Sign out')

    click_button("Sign up")
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'rubberduck')
    click_button('Submit')

    expect(page).to have_content "Username or email currently in use, please try again"
  end
end
