feature "Authentication" do

  before do 
    User.create(
      email: 'test@example.com',
      password: 'test123',
      name: 'Tester Test',
      username: 'TTest'
    )
  end

  scenario "User can login to their account" do
    visit('/sessions/new')
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'test123'
    click_button('Sign in')
    expect(page).to have_content('Welcome, TTest')
  end

  scenario "User provides the wrong email and gets an error" do
    visit('/sessions/new')
    fill_in :email, with: 'failtest@example.com'
    fill_in :password, with: 'test123'
    click_button('Sign in')
    expect(page).not_to have_content('Welcome, TTest')
    expect(page).to have_content('Please check your login details')
  end

  scenario "User provides the wrong password and gets an error" do
    visit('/sessions/new')
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'failtest123'
    click_button('Sign in')
    expect(page).not_to have_content('Welcome, TTest')
    expect(page).to have_content('Please check your login details')
  end

  scenario "User can logout" do
    visit('/sessions/new')
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'test123'
    click_button('Sign in')
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, TTest'
    expect(page).to have_content 'You have signed out'
  end
end
